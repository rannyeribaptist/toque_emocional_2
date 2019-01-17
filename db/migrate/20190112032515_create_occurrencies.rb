class CreateOccurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :occurrencies do |t|
      t.text :description
      t.string :filled_by

      t.timestamps
    end
  end
end
