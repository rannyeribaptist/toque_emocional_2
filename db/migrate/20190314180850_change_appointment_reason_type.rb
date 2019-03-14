class ChangeAppointmentReasonType < ActiveRecord::Migration[5.2]
  def up
    change_table :appointments do |t|
      t.change :reason, :text
    end
  end

  def down
    change_table :appointments do |t|
      t.change :reason, :string
    end
  end
end
