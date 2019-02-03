class CreateComplements < ActiveRecord::Migration[5.2]
  def change
    create_table :complements do |t|
      t.string :file
      t.string :name
      t.belongs_to :book, foreign_key: true

      t.timestamps
    end
  end
end
