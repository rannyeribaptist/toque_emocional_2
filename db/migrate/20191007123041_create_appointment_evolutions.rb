class CreateAppointmentEvolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_evolutions do |t|
      t.string :status
      t.belongs_to :appointment, foreign_key: true

      t.timestamps
    end
  end
end
