Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "application#index"

  get "slides", to: "application#slides", as: :slide_show
  get "about", to: "application#about", as: :about_page
end
