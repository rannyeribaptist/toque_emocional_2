class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments do |t|
      t.belongs_to :book, foreign_key: true
      t.belongs_to :guest, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
