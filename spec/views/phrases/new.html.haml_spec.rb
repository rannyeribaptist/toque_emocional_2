require 'rails_helper'

RSpec.describe "phrases/new", type: :view do
  before(:each) do
    assign(:phrase, Phrase.new(
      :content => "MyString",
      :author => "MyString"
    ))
  end

  it "renders new phrase form" do
    render

    assert_select "form[action=?][method=?]", phrases_path, "post" do

      assert_select "input[name=?]", "phrase[content]"

      assert_select "input[name=?]", "phrase[author]"
    end
  end
end
