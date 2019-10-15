class AppointmentComment < ApplicationRecord
  belongs_to :appointment_evolution
  belongs_to :user

  validates_presence_of :name, :comment, :user_id
end

# Script to update the data base when the appointment_evolutions go to production
#
# Appointment.all.each do |a|
#   if not a.appointment_evolutions.any?
#     if a.appointment_comments.any?
#       a.appointment_comments.each do |h|
#         evo = a.appointment_evolutions.new(status: 'finished')
#         evo.build_action_call(action_call: a.action_call) if a.action_call.present?
#         evo.build_appointment_observation(observation: a.observations) if a.observations.present?
#         evo.build_appointment_redirecting(redirecting: a.redirecting) if a.redirecting.present?
#         evo.build_appointment_referral(referral: a.referral) if a.referral.present?
#
#         evo.build_action_call if not a.action_call.present?
#         evo.build_appointment_observation if not a.observations.present?
#         evo.build_appointment_redirecting if not a.redirecting.present?
#         evo.build_appointment_referral if not a.referral.present?
#
#         evo.appointment_comments.build(comment: h.comment, user_id: h.user_id, name: h.name)
#         evo.save
#       end
#     else
#       evo = a.appointment_evolutions.new(status: 'ongoing')
#
#       evo.build_action_call(action_call: a.action_call) if a.action_call.present?
#       evo.build_appointment_observation(observation: a.observations) if a.observations.present?
#       evo.build_appointment_redirecting(redirecting: a.redirecting) if a.redirecting.present?
#       evo.build_appointment_referral(referral: a.referral) if a.referral.present?
#
#       evo.build_action_call if not a.action_call.present?
#       evo.build_appointment_observation if not a.observations.present?
#       evo.build_appointment_redirecting if not a.redirecting.present?
#       evo.build_appointment_referral if not a.referral.present?
#
#       evo.save
#     end
#   end
# end

# evo.build_action_call if not evo.action_call.present?
# evo.build_appointment_observation if not evo.appointment_observation.present?
# evo.build_appointment_redirecting if not evo.appointment_redirecting.present?
# evo.build_appointment_referral if not evo.appointment_referral.present?

# count = 0
# Appointment.all.each do |h|
#   if not h.appointment_evolutions.any?
#     count +=1
#   end
# end
