class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  layout "users"

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, flash: {:success => 'Usuário criado'} }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, flash: {:warning => 'Algo deu errado, verifique os campos e tente novamente'} }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user_params = user_params

    if is_admin? and @user_params[:password].empty?
      @user_params[:password] = @user.password
      @user_params[:password_confirmation] = @user_params[:password]
    end

    respond_to do |format|
      if @user.update(@user_params)
        format.html { redirect_to users_path, flash: {:success => 'Usuário atualizado'} }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, flash: {:warning => 'Algo deu errado, verifique os campos e tente novamente'} }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, flash: {:info => 'Usuário excluído'} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:school_id, :role, :email, :password, :password_confirmation)
    end
end
