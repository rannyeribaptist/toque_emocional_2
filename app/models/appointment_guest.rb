class AppointmentGuest < ApplicationRecord
  belongs_to :appointment

  validates_presence_of :name, :description
end
