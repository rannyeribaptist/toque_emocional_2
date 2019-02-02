require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      :url => "MyString",
      :name => "MyString",
      :file => "MyString"
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[url]"

      assert_select "input[name=?]", "book[name]"

      assert_select "input[name=?]", "book[file]"
    end
  end
end
