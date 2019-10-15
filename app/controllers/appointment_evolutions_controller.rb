class AppointmentEvolutionsController < ApplicationController
  before_action :set_appointment_evolution, only: [:show, :edit, :update, :destroy]

  # PATCH/PUT /appointments_evolution/1
  # PATCH/PUT /appointments_evolution/1.json
  def update
    process_status(params, @appointment_evolution)

    respond_to do |format|
      if @appointment_evolution.update(appointment_evolution_params)
        format.html { redirect_back(fallback_location: appointments_path, flash: {:success => 'Atendimento atualizado'}) }
        format.json { render :show, status: :ok, location: @appointment_evolution }
      else
        format.html { render :edit }
        format.json { render json: @appointment_evolution.errors, status: :unprocessable_entity }
      end
    end
  end

  def process_status(params, evo)
    if params["appointment_evolution"]["status"] == "finished"
      a = AppointmentEvolution.new(appointment_id: evo.appointment_id, status: "ongoing")
      a.build_action_call
      a.build_appointment_observation
      a.build_appointment_redirecting
      a.build_appointment_referral
      a.save
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment_evolution
      @appointment_evolution = AppointmentEvolution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_evolution_params
      params.require(:appointment_evolution).permit(:status, :appointment_id,
        appointment_observation_attributes: [:observation, :id, :appointment_evolution_id, :_destroy],
        action_call_attributes: [:action_call, :id, :appointment_evolution_id, :_destroy],
        appointment_referral_attributes: [:referral, :id, :appointment_evolution_id, :_destroy],
        appointment_redirecting_attributes: [:redirecting, :id, :appointment_evolution_id, :_destroy],
        appointment_comments_attributes: [:name, :comment, :user_id, :id, :appointment_evolution_id, :invisible, :_destroy])
    end
end
