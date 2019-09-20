class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  layout "users"

  # GET /appointments
  # GET /appointments.json
  def index
    @filterrific = initialize_filterrific(
      Appointment,
      params[:filterrific],
      select_options: {
        with_school_id: School.all.collect {|a| [a.name, a.id]},
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
    @appointment.appointment_students.build
    @appointment.appointment_comments.build
    @appointment.appointment_guests.build
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    make_students(params[:appointment][:appointment_students_attributes], @appointment) if params[:appointment][:appointment_students_attributes].present?
    create_guests(@appointment.appointment_guests, @appointment) if @appointment.appointment_guests.any?

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
    make_students(params[:appointment][:appointment_students_attributes], @appointment) if params[:appointment][:appointment_students_attributes].present?
    create_guests(@appointment.appointment_guests, @appointment) if @appointment.appointment_guests.any?

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
    render :json => students.map { |student| {:id => student.id, :label => (student.name + ' - ' + student.classy + ' ' + student.groupy), :value => student.name, :classy => student.classy, :groupy => student.groupy} }
  end

  def autocomplete_guest_name
    term = params[:term]
    guests = AppointmentGuest.where('name LIKE ?', "%#{term}%").order(:name).all
    guests = guests.where(school_id: current_user.school_id) if not is_admin?
    render :json => guests.map { |guest| {:id => guest.id, :label => guest.name, :value => guest.name, :description => guest.description, school_id: guest.school_id} }
  end

  def create_guests(guests, appointment)
    guests.each do |guest|
      guest.school_id = appointment.school_id if guest.school_id == nil
    end
  end

  def make_students(students, appointment)
    students.each do |student|
      if student[1]["student_id"].present?
        st = Student.find_by_id(student[1]["student_id"])
        st.name = student[1]["name"]
        st.classy = student[1]["classy"]
        st.groupy = student[1]["groupy"]
        st.save
      else
        st = Student.new(name: student[1]["name"], classy: student[1]["classy"], groupy: student[1]["groupy"], school_id: appointment.school_id)
        st.save
      end
      student[1]["student_id"] = st.id
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:kind, :spontaneous, :observations, :action_call, :referral, :redirecting, :closing, :school_id, :appointment_date, :appointment_time, :description, :reason,
        appointment_student_attributes: [:id, :student_id, :name, :classy, :groupy, :_destroy],
        appointment_comments_attributes: [:id, :name, :comment, :_destroy, :user_id, :invisible],
        appointment_guests_attributes: [:id, :name, :description, :school_id, :_destroy],
        appointment_students_attributes: [:name, :classy, :groupy, :_destroy, :id, :student_id])
    end
end
