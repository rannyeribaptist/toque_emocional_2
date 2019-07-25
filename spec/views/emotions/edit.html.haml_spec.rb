require 'rails_helper'

RSpec.describe "emotions/edit", type: :view do
  before(:each) do
    @emotion = assign(:emotion, Emotion.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit emotion form" do
    render

    assert_select "form[action=?][method=?]", emotion_path(@emotion), "post" do

      assert_select "input[name=?]", "emotion[name]"

      assert_select "textarea[name=?]", "emotion[description]"
    end
  end
end
