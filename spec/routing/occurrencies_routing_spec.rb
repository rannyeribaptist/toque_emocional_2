require "rails_helper"

RSpec.describe OccurrenciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/occurrencies").to route_to("occurrencies#index")
    end

    it "routes to #new" do
      expect(:get => "/occurrencies/new").to route_to("occurrencies#new")
    end

    it "routes to #show" do
      expect(:get => "/occurrencies/1").to route_to("occurrencies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/occurrencies/1/edit").to route_to("occurrencies#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/occurrencies").to route_to("occurrencies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/occurrencies/1").to route_to("occurrencies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/occurrencies/1").to route_to("occurrencies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/occurrencies/1").to route_to("occurrencies#destroy", :id => "1")
    end
  end
end
