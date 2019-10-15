class AddAppointmentEvolutionIdToAppointmentComments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointment_comments, :appointment_evolution_id, :integer
  end
end
