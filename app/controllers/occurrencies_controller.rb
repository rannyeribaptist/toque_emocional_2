class OccurrenciesController < ApplicationController
  before_action :set_occurrency, only: [:show, :edit, :update, :destroy]
  autocomplete :student, :name, :extra_data => [:classy, :groupy], :display_value => :funky_method

  layout "users"

  # GET /occurrencies
  # GET /occurrencies.json
  def index
    @filterrific = initialize_filterrific(
      Occurrency,
      params[:filterrific],
      select_options: {
        with_school_id: School.all.collect {|a| [a.name, a.id]},
        sorted_by: Occurrency.options_for_sorted_by
      }
    ) or return
    @occurrencies = @filterrific.find.page(params[:page]) if is_admin?
    @occurrencies = @filterrific.find.where(:school_id => current_user.school_id).page(params[:page]) if not is_admin?

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /occurrencies/1
  # GET /occurrencies/1.json
  def show
  end

  # GET /occurrencies/new
  def new
    @occurrency = Occurrency.new
    @occurrency.occurrency_students.build
  end

  # GET /occurrencies/1/edit
  def edit
  end

  # POST /occurrencies
  # POST /occurrencies.json
  def create
    @occurrency = Occurrency.new(occurrency_params)
    create_students(@occurrency.occurrency_students)

    respond_to do |format|
      if @occurrency.save
        format.html { redirect_to @occurrency, flash: {:success => 'Ocorrência registrada'} }
        format.json { render :show, status: :created, location: @occurrency }
      else
        format.html { render :new }
        format.json { render json: @occurrency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /occurrencies/1
  # PATCH/PUT /occurrencies/1.json
  def update
    create_students(@occurrency.occurrency_students)

    respond_to do |format|
      if @occurrency.update(occurrency_params)
        format.html { redirect_to @occurrency, flash: {:success => 'Ocorrência atualizada'} }
        format.json { render :show, status: :ok, location: @occurrency }
      else
        format.html { render :edit }
        format.json { render json: @occurrency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occurrencies/1
  # DELETE /occurrencies/1.json
  def destroy
    @occurrency.destroy
    respond_to do |format|
      format.html { redirect_to occurrencies_url, flash: {:success => 'Ocorrência excluída'} }
      format.json { head :no_content }
    end
  end

  def autocomplete_student_name
    term = params[:term]
    students = Student.where('name LIKE ?', "%#{term}%").order(:name).all
    students = students.where(school_id: current_user.school_id) if not is_admin?
    render :json => students.map { |student| {:id => student.id, :label => student.name, :value => student.name, :classy => student.classy, :groupy => student.groupy} }
  end

  def create_students(students)
    students.each do |student|
      st = Student.find_or_create_by(name: student.name, classy: student.classy, groupy: student.groupy, school_id: current_user.school_id)
      student.student_id = st.id
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occurrency
      @occurrency = Occurrency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def occurrency_params
      params.require(:occurrency).permit(:school_id, :description, :filled_by, occurrency_students_attributes: [:id, :student_id, :name, :classy, :groupy, :_destroy])
    end
end
