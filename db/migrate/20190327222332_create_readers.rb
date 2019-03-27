class CreateReaders < ActiveRecord::Migration[5.2]
  def change
    create_table :readers do |t|
      t.string :name
      t.string :classy
      t.string :groupy
      t.date :birthday
      t.belongs_to :school, foreign_key: true

      t.timestamps
    end
  end
end
