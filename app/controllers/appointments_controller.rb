class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  autocomplete :student, :name, :extra_data => [:classy, :groupy], :display_value => :funky_method

  layout "users"

  # GET /appointments
  # GET /appointments.json
  def index
    remove_old_appointments()

    if is_admin?
      @appointments = Appointment.all.map do |a| { :title => a.student.name, :start => a.appointment_date } end
      @aps = Appointment.all.page(params[:page])
    else
      @appointments = Appointment.where(school_id: current_user.school_id).map do |a| { :title => a.student.name, :start => a.appointment_date } end
      @aps = Appointment.where(school_id: current_user.school_id).page(params[:page])
    end

    @appointments = @appointments.to_json
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:school_id, :student_id, :appointment_date, :appointment_time, :description, :reason)
    end
end
