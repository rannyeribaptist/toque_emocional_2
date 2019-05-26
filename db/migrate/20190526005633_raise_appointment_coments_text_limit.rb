class RaiseAppointmentComentsTextLimit < ActiveRecord::Migration[5.2]
  def change
    change_column :appointment_comments, :comment, :text, :limit => 4294967295
  end
end
