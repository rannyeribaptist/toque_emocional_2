require 'rails_helper'

RSpec.describe "readers/edit", type: :view do
  before(:each) do
    @reader = assign(:reader, Reader.create!(
      :name => "MyString",
      :classy => "MyString",
      :groupy => "MyString",
      :school => nil
    ))
  end

  it "renders the edit reader form" do
    render

    assert_select "form[action=?][method=?]", reader_path(@reader), "post" do

      assert_select "input[name=?]", "reader[name]"

      assert_select "input[name=?]", "reader[classy]"

      assert_select "input[name=?]", "reader[groupy]"

      assert_select "input[name=?]", "reader[school_id]"
    end
  end
end
