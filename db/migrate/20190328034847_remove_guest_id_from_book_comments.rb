class RemoveGuestIdFromBookComments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :book_comments, :guest, foreign_key: true
  end
end
