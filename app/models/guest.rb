class Guest < ApplicationRecord
  belongs_to :school
  belongs_to :book

  validates_presence_of :code
  validates_uniqueness_of :code
end
