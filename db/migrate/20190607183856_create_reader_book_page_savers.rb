class CreateReaderBookPageSavers < ActiveRecord::Migration[5.2]
  def change
    create_table :reader_book_page_savers do |t|
      t.belongs_to :reader, foreign_key: true
      t.references :book
      t.string :current_page

      t.timestamps
    end
  end
end
