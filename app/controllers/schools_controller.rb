class SchoolsController < ApplicationController
  before_action :set_school, only: [:update, :destroy]
  before_action :authenticate_user!

  layout "users"

  # TODO: Change the routes and redirects when configs model is created
  def index
    @schools = School.all
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to schools_url, flash: {:success => 'Tudo certo! Escola salva com sucesso'} }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { redirect_to schools_url, flash: {:danger => 'Algo deu errado, preencha todos os campos corretamente'} }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to schools_url, flash: {:success => 'As novas informações foram salvas'} }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render schools_url, flash: {:danger => 'Algo deu errado, preencha todos os campos corretamente'} }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, flash: {:success => 'Escola excluída com sucesso'} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :color)
    end
end
