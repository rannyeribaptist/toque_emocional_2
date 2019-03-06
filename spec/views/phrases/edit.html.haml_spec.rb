require 'rails_helper'

RSpec.describe "phrases/edit", type: :view do
  before(:each) do
    @phrase = assign(:phrase, Phrase.create!(
      :content => "MyString",
      :author => "MyString"
    ))
  end

  it "renders the edit phrase form" do
    render

    assert_select "form[action=?][method=?]", phrase_path(@phrase), "post" do

      assert_select "input[name=?]", "phrase[content]"

      assert_select "input[name=?]", "phrase[author]"
    end
  end
end
