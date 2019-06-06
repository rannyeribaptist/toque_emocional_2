class Classy < ApplicationRecord
  validates_presence_of :name, required: true
end
