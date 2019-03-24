class AppointmentComment < ApplicationRecord
  belongs_to :appointment
  belongs_to :user

  validates_presence_of :name, :comment, :user_id
end
