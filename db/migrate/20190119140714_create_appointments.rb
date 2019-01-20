class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.belongs_to :school, foreign_key: true
      t.belongs_to :student, foreign_key: true
      t.date :appointment_date
      t.string :appointment_time
      t.text :description
      t.string :reason

      t.timestamps
    end
  end
end
