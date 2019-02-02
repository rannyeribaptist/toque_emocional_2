class Page < ApplicationRecord
  belongs_to :book

  validates_presence_of :number, :content
end
