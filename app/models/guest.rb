class Guest < ApplicationRecord
  belongs_to :book

  self.per_page = 10

  validates_presence_of :code
  validates_uniqueness_of :code
end
