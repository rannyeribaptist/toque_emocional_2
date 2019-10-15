class AppointmentEvolution < ApplicationRecord
  belongs_to :appointment

  has_one :appointment_observation, dependent: :destroy
  has_one :action_call, dependent: :destroy
  has_one :appointment_redirecting, dependent: :destroy
  has_one :appointment_referral, dependent: :destroy
  has_many :appointment_comments, dependent: :destroy

  accepts_nested_attributes_for :appointment_observation, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :action_call, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :appointment_redirecting, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :appointment_referral, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :appointment_comments, reject_if: :all_blank, allow_destroy: true
end
