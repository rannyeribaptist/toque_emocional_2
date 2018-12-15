class AddDeletedAtToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :deleted_at, :timestamp
  end
end
