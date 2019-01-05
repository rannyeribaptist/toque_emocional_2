class AddDeletedAtToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :deleted_at, :timestamp
  end
end
