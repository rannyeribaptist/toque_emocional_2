class CreateAppointmentObservations < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_observations do |t|
      t.string :observation
      t.belongs_to :appointment_evolution, foreign_key: true

      t.timestamps
    end
  end
end
