class OccurrencyHistory < ApplicationRecord
  belongs_to :occurrency
  belongs_to :student
  
  serialize :emotions, Array
end
