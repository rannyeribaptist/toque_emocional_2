class AddDeletedAtToAppointemnts < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :deleted_at, :timestamp
  end
end
