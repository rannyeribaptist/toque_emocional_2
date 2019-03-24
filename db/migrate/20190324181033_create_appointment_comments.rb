class CreateAppointmentComments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_comments do |t|
      t.string :name
      t.text :comment
      t.belongs_to :appointment, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
