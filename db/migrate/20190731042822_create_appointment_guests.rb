class CreateAppointmentGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_guests do |t|
      t.string :name
      t.string :description
      t.integer :school_id
      t.belongs_to :appointment, foreign_key: true

      t.timestamps
    end
  end
end
