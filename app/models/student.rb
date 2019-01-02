class Student < ApplicationRecord
  belongs_to :school

  validates_presence_of :name, :school
end
