Rails.application.routes.draw do
  devise_for :readers, path: 'reader', controllers: {
    sessions: 'readers/sessions',
    registrations: 'readers/registrations',
    passwords: 'readers/passwords'
  }

  devise_for :users, path: '', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated :readers do
    resources :book_comments
    resources :guests
    resources :readers
    resources :books
  end

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
    resources :phrases
    resources :guests, except: [:show]

    resources :book_comments
    resources :readers
    resources :books
  end

  root to: "application#index"

  # Static pages of the application
  get "slides", to: "application#slides", as: :slide_show
  get "about", to: "application#about", as: :about_page
  get "soon", to: "application#soon", as: :soon

  # guests personalized routes
  post "/guests/generate_access_cards", to: "guests#generate_access_cards", as: :generate_access_cards
  get "/guests/print_access_cards", to: "guests#print_access_cards", as: :print_access_cards

  # book personalized routes
  get "/livro/:url", to: "books#read", as: :read_book
  get "/livros", to: "books#list", as: :books_list
end
