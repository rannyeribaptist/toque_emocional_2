require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :name => "Name",
        :school => nil,
        :class => "Class",
        :group => "Group"
      ),
      Student.create!(
        :name => "Name",
        :school => nil,
        :class => "Class",
        :group => "Group"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Class".to_s, :count => 2
    assert_select "tr>td", :text => "Group".to_s, :count => 2
  end
end
