Rails.application.routes.draw do
  resources :books
  devise_for :users, path: '', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: "application#dashboard"
    resources :appointments do
      get :autocomplete_student_name, :on => :collection
    end
    resources :students
    resources :users
    resources :schools
    resources :occurrencies do
      get :autocomplete_student_name, :on => :collection
    end
  end

  root to: "application#index"

  get "slides", to: "application#slides", as: :slide_show
  get "about", to: "application#about", as: :about_page
  post "/books/generate_access_cards", to: "books#generate_access_cards", as: :generate_access_cards
end
