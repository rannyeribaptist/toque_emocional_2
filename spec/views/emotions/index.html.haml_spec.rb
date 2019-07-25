require 'rails_helper'

RSpec.describe "emotions/index", type: :view do
  before(:each) do
    assign(:emotions, [
      Emotion.create!(
        :name => "Name",
        :description => "MyText"
      ),
      Emotion.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of emotions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
