require 'rails_helper'

RSpec.describe "classies/edit", type: :view do
  before(:each) do
    @classy = assign(:classy, Classy.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit classy form" do
    render

    assert_select "form[action=?][method=?]", classy_path(@classy), "post" do

      assert_select "input[name=?]", "classy[name]"
    end
  end
end
