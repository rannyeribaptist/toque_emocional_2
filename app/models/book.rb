class Book < ApplicationRecord
  has_many :complements, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  accepts_nested_attributes_for :complements, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :guests, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :book_comments, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :url, :name, :file
  mount_uploader :file, ArchiveUploader
  validates_uniqueness_of :url
end
