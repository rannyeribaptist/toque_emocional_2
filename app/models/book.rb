class Book < ApplicationRecord
  has_many :complements, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  belongs_to :school
  belongs_to :reader_book_page_saver

  accepts_nested_attributes_for :complements, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :url, :name, :file, :school_id
  mount_uploader :file, ArchiveUploader
  validates_uniqueness_of :url
  validates :url, format: { with: /\A[a-zA-Z0-9\_]+\Z/ }
end
