require 'rails_helper'

RSpec.describe "classies/new", type: :view do
  before(:each) do
    assign(:classy, Classy.new(
      :name => "MyString"
    ))
  end

  it "renders new classy form" do
    render

    assert_select "form[action=?][method=?]", classies_path, "post" do

      assert_select "input[name=?]", "classy[name]"
    end
  end
end
