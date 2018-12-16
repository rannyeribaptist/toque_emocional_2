class ApplicationController < ActionController::Base
  layout "application"
  layout "users", only: :dashboard

  def index
  end

  def slides
  end

  def about
  end

  def dashboard
  end
end
