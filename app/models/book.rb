class Book < ApplicationRecord
  has_many :complements, dependent: :destroy

  accepts_nested_attributes_for :complements, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :url, :name, :file
  mount_uploader :file, ArchiveUploader
  validates_uniqueness_of :url
end
