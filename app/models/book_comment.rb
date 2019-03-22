class BookComment < ApplicationRecord
  belongs_to :book

  validates_presence_of :book_id, :comment
end
