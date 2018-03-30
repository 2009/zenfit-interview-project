require 'rails_helper'

RSpec.describe ZenTimePolicy do

  subject { described_class }

  let(:user) { create(:user) }
  let(:manager) { create(:manager) }
  let(:admin) { create(:admin) }

  permissions ".scope" do

  end

  permissions :show?, :update?, :destroy? do
    describe "no user" do
      let(:zen_time) { create(:zen_time, user: user) }

      it "raises exception" do
        expect {
          subject.new(nil, zen_time)
        }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    describe "normal user" do

      let(:zen_time) { create(:zen_time, user: user) }
      let(:another_user) { create(:user) }
      let(:another_zen_time) { create(:zen_time, user: another_user) }

      it "allows access if user owns ZenTime" do
        expect(subject).to permit(user, zen_time)
      end

      it "denies if user doesn't own ZenTime" do
        expect(subject).to_not permit(user, another_zen_time)
      end
    end

    describe "manager user" do

      let(:zen_time) { create(:zen_time, user: manager) }
      let(:another_zen_time) { create(:zen_time, user: user) }

      it "allows access if user owns ZenTime" do
        expect(subject).to permit(manager, zen_time)
      end

      it "denies if user doesn't own ZenTime" do
        expect(subject).to_not permit(manager, another_zen_time)
      end
    end

    describe "admin user" do
      let(:another_admin) { create(:admin) }
      let(:user_zen_time) { create(:zen_time, user: user) }
      let(:manager_zen_time) { create(:zen_time, user: manager) }
      let(:admin_zen_time) { create(:zen_time, user: another_admin) }

      it "allows access" do
        expect(subject).to permit(admin, user_zen_time)
        expect(subject).to permit(admin, manager_zen_time)
        expect(subject).to permit(admin, admin_zen_time)
      end
    end
  end

  permissions :create? do
    it "allows access" do
      expect(subject).to permit(user, ZenTime.new)
    end
  end
end
