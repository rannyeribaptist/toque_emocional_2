class RemoveStudentFromAppointmentStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointment_students, :student_id
  end
end
