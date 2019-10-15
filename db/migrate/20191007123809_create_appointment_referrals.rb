class CreateAppointmentReferrals < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_referrals do |t|
      t.string :referral
      t.belongs_to :appointment_evolution, foreign_key: true

      t.timestamps
    end
  end
end
