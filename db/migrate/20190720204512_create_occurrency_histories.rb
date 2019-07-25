class CreateOccurrencyHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :occurrency_histories do |t|
      t.belongs_to :student, foreign_key: true
      t.belongs_to :occurrency, foreign_key: true
      t.string :emotions

      t.timestamps
    end
  end
end
