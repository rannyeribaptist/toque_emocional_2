class AddClosingToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :closing, :text
  end
end
