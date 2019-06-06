require 'rails_helper'

RSpec.describe "classies/index", type: :view do
  before(:each) do
    assign(:classies, [
      Classy.create!(
        :name => "Name"
      ),
      Classy.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of classies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
