class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.belongs_to :school, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
