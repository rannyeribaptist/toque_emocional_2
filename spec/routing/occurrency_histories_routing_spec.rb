require "rails_helper"

RSpec.describe OccurrencyHistoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/occurrency_histories").to route_to("occurrency_histories#index")
    end

    it "routes to #new" do
      expect(:get => "/occurrency_histories/new").to route_to("occurrency_histories#new")
    end

    it "routes to #show" do
      expect(:get => "/occurrency_histories/1").to route_to("occurrency_histories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/occurrency_histories/1/edit").to route_to("occurrency_histories#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/occurrency_histories").to route_to("occurrency_histories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/occurrency_histories/1").to route_to("occurrency_histories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/occurrency_histories/1").to route_to("occurrency_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/occurrency_histories/1").to route_to("occurrency_histories#destroy", :id => "1")
    end
  end
end
