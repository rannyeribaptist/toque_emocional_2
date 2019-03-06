require 'rails_helper'

RSpec.describe "phrases/show", type: :view do
  before(:each) do
    @phrase = assign(:phrase, Phrase.create!(
      :content => "Content",
      :author => "Author"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Author/)
  end
end
