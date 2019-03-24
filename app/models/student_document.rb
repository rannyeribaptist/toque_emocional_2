class StudentDocument < ApplicationRecord
  belongs_to :student

  validates_presence_of :name, :file, :student_id

  mount_uploader :file, ComplementsUploader
end
