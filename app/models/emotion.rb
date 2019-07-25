class Emotion < ApplicationRecord
  has_many :feelings
  
  accepts_nested_attributes_for :feelings, allow_destroy: true, reject_if: :all_blank
  validates_presence_of :name, :description
end
