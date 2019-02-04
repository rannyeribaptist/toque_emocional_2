class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :classy
      t.string :groupy
      t.belongs_to :school, foreign_key: true
      t.string :code
      t.boolean :authenticated
      t.belongs_to :book, foreign_key: true

      t.timestamps
    end
  end
end
