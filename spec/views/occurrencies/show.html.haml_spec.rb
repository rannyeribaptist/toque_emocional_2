require 'rails_helper'

RSpec.describe "occurrencies/show", type: :view do
  before(:each) do
    @occurrency = assign(:occurrency, Occurrency.create!(
      :description => "MyText",
      :filled_by => "Filled By"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Filled By/)
  end
end
