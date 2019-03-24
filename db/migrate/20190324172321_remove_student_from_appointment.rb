class RemoveStudentFromAppointment < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :student_id
  end
end
