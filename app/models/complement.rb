class Complement < ApplicationRecord
  belongs_to :book

  validates_presence_of :name, :file
  mount_uploader :file, ComplementUploader
end
