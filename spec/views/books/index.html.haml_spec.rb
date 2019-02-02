require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :url => "Url",
        :name => "Name",
        :file => "File"
      ),
      Book.create!(
        :url => "Url",
        :name => "Name",
        :file => "File"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "File".to_s, :count => 2
  end
end
