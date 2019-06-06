class ClassiesController < ApplicationController
  before_action :set_classy, only: [:update, :destroy]
  before_action :authenticate_user!, :validate_permission

  layout "users"

  # GET /classies
  # GET /classies.json
  def index
    @classies = Classy.all
    @classy = Classy.new
  end

  # POST /classies
  # POST /classies.json
  def create
    @classy = Classy.new(classy_params)

    respond_to do |format|
      if @classy.save
        format.html { redirect_to classies_url, notice: 'Criado com sucesso.' }
        format.json { render :show, status: :created, location: @classy }
      else
        format.html {
          flash[:danger] = 'Algo deu errado e não foi possível salvar esta turma.'
          redirect_to classies_url
        }
        format.json { render json: @classy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classies/1
  # PATCH/PUT /classies/1.json
  def update
    respond_to do |format|
      if @classy.update(classy_params)
        format.html { redirect_to classies_url, notice: 'Salvo com sucesso.' }
        format.json { render :show, status: :ok, location: @classy }
      else
        format.html {
          flash[:danger] = 'Não foi possível salvar estas alterações.'
          redirect_to classies_url
        }
        format.json { render json: @classy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classies/1
  # DELETE /classies/1.json
  def destroy
    @classy.destroy
    respond_to do |format|
      format.html { redirect_to classies_url, notice: 'Classy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classy
      @classy = Classy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classy_params
      params.require(:classy).permit(:name)
    end
end
