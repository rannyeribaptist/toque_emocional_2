require 'rails_helper'

RSpec.describe "occurrency_histories/show", type: :view do
  before(:each) do
    @occurrency_history = assign(:occurrency_history, OccurrencyHistory.create!(
      :student => nil,
      :occurrency => nil,
      :emotions => "Emotions"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Emotions/)
  end
end
