class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  autocomplete :student, :name, :extra_data => [:classy, :groupy], :display_value => :funky_method

  layout "users"

  # GET /appointments
  # GET /appointments.json
  def index
    @filterrific = initialize_filterrific(
      Appointment,
      params[:filterrific],
      select_options: {
        sorted_by: Appointment.options_for_sorted_by
      }
    ) or return
    @appointments = @filterrific.find.page(params[:page]) if is_admin?
    @appointments = @filterrific.find.where(:school_id => current_user.school_id).page(params[:page]) if not is_admin?

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @appointment.build_appointment_student
    @appointment.appointment_comments.build
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    create_student(@appointment.appointment_student, params[:appointment][:school_id])

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, flash: {:success => 'Atendimento agendado'} }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    create_student(@appointment.appointment_student, params[:appointment][:school_id])

    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, flash: {:success => 'Atendimento atualizado'} }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, flash: {:success => 'Atendimento excluído'} }
      format.json { head :no_content }
    end
  end

  def autocomplete_student_name
    term = params[:term]
    students = Student.where('name LIKE ?', "%#{term}%").order(:name).all
    students = students.where(school_id: current_user.school_id) if not is_admin?
    render :json => students.map { |student| {:id => student.id, :label => student.name, :value => student.name, :classy => student.classy, :groupy => student.groupy} }
  end

  def create_student(student, school)
    a = Student.find_or_create_by(name: student.name, classy: student.classy, groupy: student.groupy, school_id: school)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:school_id, :appointment_date, :appointment_time, :description, :reason, appointment_student_attributes: [:id, :student_id, :name, :classy, :groupy, :_destroy], appointment_comments_attributes: [:id, :name, :comment, :_destroy, :user_id])
    end
end
