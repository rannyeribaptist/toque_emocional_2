class BookComment < ApplicationRecord
  belongs_to :guest
  belongs_to :book

  validates_presence_of :book_id, :comment

  # TODO: Add validation for presence of guest when the authentication is completed
  # validates_presence_of :guest
end
