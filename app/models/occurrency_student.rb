class OccurrencyStudent < ApplicationRecord
  belongs_to :occurrency
  belongs_to :student

  # has_trash
  validates_presence_of :student, :name, :classy, :groupy
end
