require 'rails_helper'

RSpec.describe "occurrency_histories/index", type: :view do
  before(:each) do
    assign(:occurrency_histories, [
      OccurrencyHistory.create!(
        :student => nil,
        :occurrency => nil,
        :emotions => "Emotions"
      ),
      OccurrencyHistory.create!(
        :student => nil,
        :occurrency => nil,
        :emotions => "Emotions"
      )
    ])
  end

  it "renders a list of occurrency_histories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Emotions".to_s, :count => 2
  end
end
