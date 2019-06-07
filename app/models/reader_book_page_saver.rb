class ReaderBookPageSaver < ApplicationRecord
  belongs_to :reader
  has_one :book

  validates_presence_of :reader_id, :book_id, :current_page
end
