class ApplicationController < ActionController::Base
  layout "application"
  layout "users", only: :dashboard

  before_action :configure_permitted_parameters, if: :devise_controller?

  include ApplicationHelper

  def index
  end

  def slides
  end

  def about
  end

  def dashboard
  end

  def soon
  end

  protected

    def configure_permitted_parameters
      added_attrs = [:sign_up_code, :school_id, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    end
end
