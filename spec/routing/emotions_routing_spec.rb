require "rails_helper"

RSpec.describe EmotionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/emotions").to route_to("emotions#index")
    end

    it "routes to #new" do
      expect(:get => "/emotions/new").to route_to("emotions#new")
    end

    it "routes to #show" do
      expect(:get => "/emotions/1").to route_to("emotions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/emotions/1/edit").to route_to("emotions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/emotions").to route_to("emotions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/emotions/1").to route_to("emotions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/emotions/1").to route_to("emotions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/emotions/1").to route_to("emotions#destroy", :id => "1")
    end
  end
end
