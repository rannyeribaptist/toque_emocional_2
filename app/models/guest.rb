class Guest < ApplicationRecord
  belongs_to :book
  has_many :book_comments

  validates_presence_of :code
  validates_uniqueness_of :code
end
