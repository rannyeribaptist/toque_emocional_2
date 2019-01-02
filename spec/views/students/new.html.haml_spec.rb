require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      :name => "MyString",
      :school => nil,
      :class => "MyString",
      :group => "MyString"
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input[name=?]", "student[name]"

      assert_select "input[name=?]", "student[school_id]"

      assert_select "input[name=?]", "student[class]"

      assert_select "input[name=?]", "student[group]"
    end
  end
end
