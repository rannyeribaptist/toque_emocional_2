class Feeling < ApplicationRecord
  belongs_to :emotion

  validates_presence_of :description
end
