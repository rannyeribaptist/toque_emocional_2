require 'rails_helper'

RSpec.describe "readers/new", type: :view do
  before(:each) do
    assign(:reader, Reader.new(
      :name => "MyString",
      :classy => "MyString",
      :groupy => "MyString",
      :school => nil
    ))
  end

  it "renders new reader form" do
    render

    assert_select "form[action=?][method=?]", readers_path, "post" do

      assert_select "input[name=?]", "reader[name]"

      assert_select "input[name=?]", "reader[classy]"

      assert_select "input[name=?]", "reader[groupy]"

      assert_select "input[name=?]", "reader[school_id]"
    end
  end
end
