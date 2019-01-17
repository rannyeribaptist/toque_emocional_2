class CreateOccurrencyStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :occurrency_students do |t|
      t.belongs_to :occurrency, foreign_key: true
      t.belongs_to :student, foreign_key: true
      t.string :name
      t.string :classy
      t.string :groupy

      t.timestamps
    end
  end
end
