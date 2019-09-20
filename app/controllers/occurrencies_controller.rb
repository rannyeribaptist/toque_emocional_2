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
    @occurrency.occurrency_histories.build
  end

  # GET /occurrencies/1/edit
  def edit
  end

  # POST /occurrencies
  # POST /occurrencies.json
  def create
    @occurrency = Occurrency.new(occurrency_params)
    make_students(0, @occurrency.occurrency_students, @occurrency) if params[:occurrency][:occurrency_students_attributes].present?

    respond_to do |format|
      if @occurrency.save
        create_histories(@occurrency.occurrency_students, @occurrency)

        format.html { redirect_to @occurrency, flash: {:success => 'Passo 1 concluído, preencha o passo 2 para finalizar.'} }
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
    make_students(@occurrency.occurrency_histories.count, params[:occurrency][:occurrency_students_attributes], @occurrency) if params[:occurrency][:occurrency_students_attributes].present?
    create_histories(@occurrency.occurrency_students, @occurrency)
    delete_histories(params[:occurrency][:occurrency_students_attributes], @occurrency) if params[:occurrency][:occurrency_students_attributes].present?

    respond_to do |format|
      if @occurrency.update(occurrency_params)
        format.html { redirect_to review_occurrency_path(occurrency_id: @occurrency.id) } if params[:occurrency][:finished].present?
        format.html { redirect_to @occurrency, flash: {:success => 'Ocorrência atualizada'} } if not params[:occurrency][:finished].present?
        format.json { render :show, status: :ok, location: @occurrency }
        format.js { render :show, status: :ok, location: @occurrency }
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
    render :json => students.map { |student| {:id => student.id, :label => (student.name + ' - ' + student.classy + ' ' + student.groupy), :value => student.name, :classy => student.classy, :groupy => student.groupy} }
  end

  def make_students(total, students, occurrency)
    students.each do |student|
      if student.student_id.present?
        st = Student.find_by_id(student.student_id)
        st.name = student.name
        st.classy = student.classy
        st.groupy = student.groupy
        st.save!
      else
        st = Student.new(name: student.name, classy: student.classy, groupy: student.groupy, school_id: occurrency.school_id)
        st.save
      end
      student.student_id = st.id

      puts "AAAAAAAAAAAAA"
      puts st.id
      puts occurrency

      history = OccurrencyHistory.find_or_create_by(student_id: st.id, occurrency_id: occurrency.id)
    end

    if total < @occurrency.occurrency_histories.count and total != 0
      occurrency.finished = false
    end
  end

  # def update_students(total, students, occurrency)
  #   students.each do |student|
  #     st = Student.find_or_create_by(name: student[1]["name"], classy: student[1]["classy"], groupy: student[1]["groupy"], school_id: occurrency.school_id)
  #     student[1]["student_id"] = st.id
  #     history = OccurrencyHistory.find_or_create_by(student_id: st.id, occurrency_id: occurrency.id)
  #   end
  #
  #   if total < @occurrency.occurrency_histories.count
  #     occurrency.finished = false
  #   end
  # end

  def delete_histories(students, occurrency)
    students.each do |student|
      if (student[1][:_destroy] == "1") or (student[1][:_destroy] == "true") or (student[1][:_destroy] == true)
        occurrency = OccurrencyHistory.where(:student_id => student[1]["student_id"], :occurrency_id => occurrency.id).first
        occurrency.destroy if occurrency.present?
      end
    end
  end

  def create_histories(students, occurrency)
    students.each_with_index do |student, i|
      if not occurrency.occurrency_histories.where(student_id: student.student_id).any?
        history = occurrency.occurrency_histories.new(student_id: student.student_id)
        history.save
      else
        history = occurrency.occurrency_histories.where(student_id: student.student_id)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occurrency
      @occurrency = Occurrency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def occurrency_params
      params.require(:occurrency).permit(:finished, :school_id, :emotional_sphere, :description, :filled_by, occurrency_students_attributes: [:id, :student_id, :name, :classy, :groupy, :_destroy], occurrency_histories_attributes: [:id, :_destroy, :student_id, :emotions => []] )
    end
end
