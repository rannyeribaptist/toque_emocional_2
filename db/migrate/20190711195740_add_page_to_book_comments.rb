class AddPageToBookComments < ActiveRecord::Migration[5.2]
  def change
    add_column :book_comments, :page, :string
  end
end
