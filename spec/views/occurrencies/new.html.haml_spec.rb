require 'rails_helper'

RSpec.describe "occurrencies/new", type: :view do
  before(:each) do
    assign(:occurrency, Occurrency.new(
      :description => "MyText",
      :filled_by => "MyString"
    ))
  end

  it "renders new occurrency form" do
    render

    assert_select "form[action=?][method=?]", occurrencies_path, "post" do

      assert_select "textarea[name=?]", "occurrency[description]"

      assert_select "input[name=?]", "occurrency[filled_by]"
    end
  end
end
