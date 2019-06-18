class CreateRelatories < ActiveRecord::Migration[5.2]
  def change
    create_table :relatories do |t|

      t.timestamps
    end
  end
end
