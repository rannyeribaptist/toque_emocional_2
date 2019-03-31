class AddReaderToBookComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :book_comments, :reader, foreign_key: true
  end
end
