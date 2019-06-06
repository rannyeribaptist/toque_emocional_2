require "rails_helper"

RSpec.describe ClassiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/classies").to route_to("classies#index")
    end

    it "routes to #new" do
      expect(:get => "/classies/new").to route_to("classies#new")
    end

    it "routes to #show" do
      expect(:get => "/classies/1").to route_to("classies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/classies/1/edit").to route_to("classies#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/classies").to route_to("classies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/classies/1").to route_to("classies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/classies/1").to route_to("classies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/classies/1").to route_to("classies#destroy", :id => "1")
    end
  end
end
