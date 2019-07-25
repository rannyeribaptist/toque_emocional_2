require 'rails_helper'

RSpec.describe "emotions/show", type: :view do
  before(:each) do
    @emotion = assign(:emotion, Emotion.create!(
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
