class AddInvisibleToAppointmentComment < ActiveRecord::Migration[5.2]
  def change
    add_column :appointment_comments, :invisible, :boolean
  end
end
