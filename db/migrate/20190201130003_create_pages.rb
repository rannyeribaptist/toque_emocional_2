class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.belongs_to :book, foreign_key: true
      t.string :number
      t.text :content, :limit => 16777215

      t.timestamps
    end
  end
end
