class Appointment < ApplicationRecord
  belongs_to :school
  belongs_to :student

  has_trash
  self.per_page = 10

  validates_presence_of :student_id, :school_id, :appointment_date, :appointment_time, :reason
end
