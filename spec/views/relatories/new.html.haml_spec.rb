require 'rails_helper'

RSpec.describe "relatories/new", type: :view do
  before(:each) do
    assign(:relatory, Relatory.new())
  end

  it "renders new relatory form" do
    render

    assert_select "form[action=?][method=?]", relatories_path, "post" do
    end
  end
end
