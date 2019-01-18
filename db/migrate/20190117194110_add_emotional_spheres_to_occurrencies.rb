class AddEmotionalSpheresToOccurrencies < ActiveRecord::Migration[5.2]
  def change
    add_column :occurrencies, :emotional_sphere, :string
  end
end
