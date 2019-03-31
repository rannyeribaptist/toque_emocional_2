class CreateBookLists < ActiveRecord::Migration[5.2]
  def change
    create_table :book_lists do |t|
      t.belongs_to :reader, foreign_key: true
      t.string :books

      t.timestamps
    end
  end
end
