require 'rails_helper'

RSpec.describe UserPolicy do

  subject { described_class }

  let(:user) { create(:user) }
  let(:manager) { create(:manager) }
  let(:admin) { create(:admin) }

  permissions ".scope" do

    let!(:users) { create_list(:user, 10) }
    let!(:managers) { create_list(:manager, 10) }
    let!(:admins) { create_list(:admin, 10) }

    it "returns all users for admins" do
      scope = subject::Scope.new(admin, User.all).resolve
      expect(scope).to eq(User.all)
    end

    it "returns all users with user role for managers" do
      scope = subject::Scope.new(manager, User.all).resolve
      expect(scope).to eq(User.where(role: 'user'))
    end

    it "returns only own user for normal users" do
      scope = subject::Scope.new(user, User.all).resolve
      expect(scope).to eq([user])
    end

    #pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :show?, :update?, :destroy? do

    describe "normal user" do

      let(:another_user) { create(:user) }

      it "allows access if user has matching id" do
        expect(subject).to permit(user, user)
      end

      it "denies if user doesn't match id" do
        expect(subject).to_not permit(user, another_user)
      end

      it "denies access if user has manager role" do
        expect(subject).to_not permit(user, manager)
      end

      it "denies access if user has admin role" do
        expect(subject).to_not permit(user, admin)
      end
    end

    describe "manager user" do

      let(:another_manager) { create(:manager) }

      it "allows access if user has user role" do
        expect(subject).to permit(manager, user)
      end

      it "denies access if user has manager role" do
        expect(subject).to_not permit(manager, another_manager)
      end

      it "denies access if user has admin role" do
        expect(subject).to_not permit(manager, admin)
      end
    end

    describe "admin user" do
      let(:another_admin) { create(:admin) }

      it "allows access to all user roles" do
        expect(subject).to permit(admin, user)
        expect(subject).to permit(admin, manager)
        expect(subject).to permit(admin, another_admin)
      end
    end
  end

  permissions :create? do
    it "allows access" do
      expect(subject).to permit(user, User.new)
    end
  end

end
