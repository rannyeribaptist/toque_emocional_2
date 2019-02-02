require 'rails_helper'

RSpec.describe Book, type: :model do
  context "must validate fields" do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:file) }
  end

  context "must have pages" do
    it "can't save if there's no pages" do
      book = Book.new(url: "test", name: "test", file: "test")

      expect(book.save).to be_falsy
    end

    it "should save if at least one page has been created" do
      book = Book.new(url: "test", name: "test", file: "test")
      book.pages.new(number: "1", content: "test", book_id: book.id)

      expect(book.save).to be_truthy
    end
  end
end
