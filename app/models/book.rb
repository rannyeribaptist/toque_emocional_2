class Book < ApplicationRecord
  validates_presence_of :url, :name, :file
  mount_uploader :file, ArchiveUploader
end
