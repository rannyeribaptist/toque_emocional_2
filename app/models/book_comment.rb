class BookComment < ApplicationRecord
  belongs_to :book
  belongs_to :reader

  validates_presence_of :book_id, :comment, :reader_id
end
