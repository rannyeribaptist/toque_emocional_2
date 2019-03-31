class BookList < ApplicationRecord
  belongs_to :reader

  serialize :books, Object
end
