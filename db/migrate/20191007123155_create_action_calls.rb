class CreateActionCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :action_calls do |t|
      t.string :action_call
      t.belongs_to :appointment_evolution, foreign_key: true

      t.timestamps
    end
  end
end
