class AppointmentStudent < ApplicationRecord
  belongs_to :appointment

  # has_trash
  validates_presence_of :name, :classy, :groupy
end
