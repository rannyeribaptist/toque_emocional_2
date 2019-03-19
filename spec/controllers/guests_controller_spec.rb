require 'rails_helper'

RSpec.describe GuestsController, type: :controller do

  describe "GET #book_comments" do
    it "returns http success" do
      get :book_comments
      expect(response).to have_http_status(:success)
    end
  end

end
