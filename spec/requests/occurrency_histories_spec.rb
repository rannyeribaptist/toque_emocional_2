require 'rails_helper'

RSpec.describe "OccurrencyHistories", type: :request do
  describe "GET /occurrency_histories" do
    it "works! (now write some real specs)" do
      get occurrency_histories_path
      expect(response).to have_http_status(200)
    end
  end
end
