class CreateAppointmentStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_students do |t|
      t.belongs_to :appointment, foreign_key: true
      t.belongs_to :student, foreign_key: true
      t.string :name
      t.string :classy
      t.string :groupy

      t.timestamps
    end
  end
end
