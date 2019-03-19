class AddDeletedAtToAppointmentStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :appointment_students, :deleted_at, :timestamp
  end
end
