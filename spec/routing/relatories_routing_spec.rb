require "rails_helper"

RSpec.describe RelatoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/relatories").to route_to("relatories#index")
    end

    it "routes to #new" do
      expect(:get => "/relatories/new").to route_to("relatories#new")
    end

    it "routes to #show" do
      expect(:get => "/relatories/1").to route_to("relatories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/relatories/1/edit").to route_to("relatories#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/relatories").to route_to("relatories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/relatories/1").to route_to("relatories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/relatories/1").to route_to("relatories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/relatories/1").to route_to("relatories#destroy", :id => "1")
    end
  end
end
