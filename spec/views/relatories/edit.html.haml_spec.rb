require 'rails_helper'

RSpec.describe "relatories/edit", type: :view do
  before(:each) do
    @relatory = assign(:relatory, Relatory.create!())
  end

  it "renders the edit relatory form" do
    render

    assert_select "form[action=?][method=?]", relatory_path(@relatory), "post" do
    end
  end
end
