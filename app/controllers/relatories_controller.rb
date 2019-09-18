class RelatoriesController < ApplicationController
  before_action :authenticate_user!, :validate_permission

  layout "users"

  def index
  end

  def appointments
    @filterrific = initialize_filterrific(
      Appointment,
      params[:filterrific],
      select_options: {
        with_school_id: School.all.collect {|a| [a.name, a.id]},
        sorted_by: Appointment.options_for_sorted_by
      }
    ) or return
    @appointments = @filterrific.find if is_admin?
    @appointments = @filterrific.find.where(:school_id => current_user.school_id) if not is_admin?

    respond_to do |format|
      format.html
      format.js
    end
  end

  def print_occurrencies
    @occurrencies = Occurrency.where(id: params[:ids].split('/'))
    render layout: "printing_layout"
  end

  def occurrencies
    @filterrific = initialize_filterrific(
      Occurrency,
      params[:filterrific],
      select_options: {
        with_school_id: School.all.collect {|a| [a.name, a.id]},
        sorted_by: Occurrency.options_for_sorted_by
      }
    ) or return
    @occurrencies = @filterrific.find if is_admin?
    @occurrencies = @filterrific.find.where(:school_id => current_user.school_id) if not is_admin?

    respond_to do |format|
      format.html
      format.js
    end
  end

  def print_occurrencies
    @occurrencies = Occurrency.where(id: params[:ids].split('/'))
    render layout: "printing_layout"
  end
end
