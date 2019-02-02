class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :url
      t.string :name
      t.string :file

      t.timestamps
    end
  end
end
