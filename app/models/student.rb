class Student < ApplicationRecord
  belongs_to :school

  has_trash
  validates_presence_of :name, :school
end
