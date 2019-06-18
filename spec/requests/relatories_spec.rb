require 'rails_helper'

RSpec.describe "Relatories", type: :request do
  describe "GET /relatories" do
    it "works! (now write some real specs)" do
      get relatories_path
      expect(response).to have_http_status(200)
    end
  end
end
