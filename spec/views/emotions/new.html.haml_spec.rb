require 'rails_helper'

RSpec.describe "emotions/new", type: :view do
  before(:each) do
    assign(:emotion, Emotion.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new emotion form" do
    render

    assert_select "form[action=?][method=?]", emotions_path, "post" do

      assert_select "input[name=?]", "emotion[name]"

      assert_select "textarea[name=?]", "emotion[description]"
    end
  end
end
