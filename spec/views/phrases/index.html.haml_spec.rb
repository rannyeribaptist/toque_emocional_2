require 'rails_helper'

RSpec.describe "phrases/index", type: :view do
  before(:each) do
    assign(:phrases, [
      Phrase.create!(
        :content => "Content",
        :author => "Author"
      ),
      Phrase.create!(
        :content => "Content",
        :author => "Author"
      )
    ])
  end

  it "renders a list of phrases" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
  end
end
