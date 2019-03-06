class CreatePhrases < ActiveRecord::Migration[5.2]
  def change
    create_table :phrases do |t|
      t.string :content
      t.string :author

      t.timestamps
    end
  end
end
