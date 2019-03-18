class AppointmentStudent < ApplicationRecord
  belongs_to :appointment
  belongs_to :student

  # has_trash
  validates_presence_of :student_id, :name, :classy, :groupy
end
