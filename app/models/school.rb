class School < ApplicationRecord
  validates_presence_of :name, :color, required: true

  has_one :user, dependent: :destroy
end
