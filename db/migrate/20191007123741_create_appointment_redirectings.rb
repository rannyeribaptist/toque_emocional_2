class CreateAppointmentRedirectings < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_redirectings do |t|
      t.string :redirecting
      t.belongs_to :appointment_evolution, foreign_key: true

      t.timestamps
    end
  end
end
