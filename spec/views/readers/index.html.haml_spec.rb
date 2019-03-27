require 'rails_helper'

RSpec.describe "readers/index", type: :view do
  before(:each) do
    assign(:readers, [
      Reader.create!(
        :name => "Name",
        :classy => "Classy",
        :groupy => "Groupy",
        :school => nil
      ),
      Reader.create!(
        :name => "Name",
        :classy => "Classy",
        :groupy => "Groupy",
        :school => nil
      )
    ])
  end

  it "renders a list of readers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Classy".to_s, :count => 2
    assert_select "tr>td", :text => "Groupy".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
