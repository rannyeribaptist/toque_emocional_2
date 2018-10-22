class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :segment
      t.text :description
      t.string :city
      t.string :state
      t.string :role, null: false, default: "user"

      t.timestamps
    end
  end
end
