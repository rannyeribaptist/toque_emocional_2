class AddNewFieldsToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :kind, :string
    add_column :appointments, :referral, :string
    add_column :appointments, :redirecting, :string
    add_column :appointments, :action_call, :string
    add_column :appointments, :observations, :string
    add_column :appointments, :spontaneous, :boolean
  end
end
