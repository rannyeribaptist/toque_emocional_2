require 'rails_helper'

RSpec.describe "occurrencies/index", type: :view do
  before(:each) do
    assign(:occurrencies, [
      Occurrency.create!(
        :description => "MyText",
        :filled_by => "Filled By"
      ),
      Occurrency.create!(
        :description => "MyText",
        :filled_by => "Filled By"
      )
    ])
  end

  it "renders a list of occurrencies" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Filled By".to_s, :count => 2
  end
end
