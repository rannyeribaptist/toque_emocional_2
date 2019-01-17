class AddDeletedAtToOccurrencies < ActiveRecord::Migration[5.2]
  def change
    add_column :occurrencies, :deleted_at, :timestamp
    add_column :occurrency_students, :deleted_at, :timestamp
  end
end
