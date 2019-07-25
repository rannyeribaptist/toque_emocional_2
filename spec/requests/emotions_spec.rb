require 'rails_helper'

RSpec.describe "Emotions", type: :request do
  describe "GET /emotions" do
    it "works! (now write some real specs)" do
      get emotions_path
      expect(response).to have_http_status(200)
    end
  end
end
