class CreateClassies < ActiveRecord::Migration[5.2]
  def change
    create_table :classies do |t|
      t.string :name

      t.timestamps
    end
  end
end
