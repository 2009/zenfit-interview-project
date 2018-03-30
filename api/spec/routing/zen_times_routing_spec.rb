require "rails_helper"

RSpec.describe ZenTimesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/zen_times").to route_to("zen_times#index")
    end


    it "routes to #show" do
      expect(:get => "/zen_times/1").to route_to("zen_times#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/zen_times").to route_to("zen_times#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/zen_times/1").to route_to("zen_times#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/zen_times/1").to route_to("zen_times#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/zen_times/1").to route_to("zen_times#destroy", :id => "1")
    end

  end
end
