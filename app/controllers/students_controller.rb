class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  layout "users"

  # GET /students
  # GET /students.json
  def index
    @filterrific = initialize_filterrific(
      Student,
      params[:filterrific],
      select_options: {
        with_school_id: School.all.collect {|a| [a.name, a.id]},
        sorted_by: Student.options_for_sorted_by
      }
    ) or return
    @students = @filterrific.find.page(params[:page]) if is_admin?
    @students = @filterrific.find.where(:school_id => current_user.school_id).page(params[:page]) if not is_admin?

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    @student.student_documents.build
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if is_admin? || student_params[:school_id].to_s == current_user.school_id.to_s
        if @student.save
          format.html { redirect_to @student, flash: {:success => 'Estudante criado'} }
          format.json { render :show, status: :created, location: @student }
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if is_admin? || student_params[:school_id].to_s == current_user.school_id.to_s
        if @student.update(student_params)
          format.html { redirect_to @student, flash: {:success => 'Estudante atualizado'} }
          format.json { render :show, status: :ok, location: @student }
        else
          format.html { render :edit }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, flash: {:info => 'Estudante Excluído'} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :school_id, :classy, :groupy, :student_documents_attributes => [:name, :id, :_destroy, :file, :student_id])
    end
end
