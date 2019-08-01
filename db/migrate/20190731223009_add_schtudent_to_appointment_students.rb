class AddSchtudentToAppointmentStudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointment_students, :student, foreign_key: true
  end
end
