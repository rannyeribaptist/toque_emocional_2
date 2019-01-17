require 'rails_helper'

RSpec.describe "occurrencies/edit", type: :view do
  before(:each) do
    @occurrency = assign(:occurrency, Occurrency.create!(
      :description => "MyText",
      :filled_by => "MyString"
    ))
  end

  it "renders the edit occurrency form" do
    render

    assert_select "form[action=?][method=?]", occurrency_path(@occurrency), "post" do

      assert_select "textarea[name=?]", "occurrency[description]"

      assert_select "input[name=?]", "occurrency[filled_by]"
    end
  end
end
