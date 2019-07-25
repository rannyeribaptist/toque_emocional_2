class CreateFeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :feelings do |t|
      t.belongs_to :emotion, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
