require 'rails_helper'

RSpec.describe "Occurrencies", type: :request do
  describe "GET /occurrencies" do
    it "works! (now write some real specs)" do
      get occurrencies_path
      expect(response).to have_http_status(200)
    end
  end
end
