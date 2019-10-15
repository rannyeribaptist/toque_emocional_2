Rails.application.routes.draw do
  resources :occurrency_histories
  resources :emotions
  devise_for :readers, path: 'reader', controllers: {
    sessions: 'readers/sessions',
    registrations: 'readers/registrations',
    passwords: 'readers/passwords'
  }

  devise_for :users, path: '', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated :reader do
    root to: "books#list"
    resources :guests
    resources :readers
    resources :books

    patch "/reader/update_book_comments/:id", to: "readers#update_book_comments", as: :edit_book_comment
    delete "/reader/update_book_comments/:id", to: "readers#delete_book_comments", as: :delete_book_comment
    post "/livros/add/:code", to: "readers#add_book", as: :add_book
    get "/validate_book_code", to: "readers#validate_book_code", as: :validate_book_code
  end

  authenticated :user do
    root to: "application#dashboard"

    resources :appointments do
      get :autocomplete_student_name, :on => :collection
      get :autocomplete_guest_name, :on => :collection
    end
    resources :occurrencies do
      get :autocomplete_student_name, :on => :collection
    end

    resources :appointment_evolutions
    resources :students
    resources :users
    resources :schools
    resources :phrases
    resources :guests, except: [:show]
    resources :classies
    resources :readers
    resources :books

    get "/review_occurrency/:occurrency_id", to: "application#review_occurrency", as: :review_occurrency
  end

  # root to: "application#index"
  root to: "application#coming_soon"

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

  post "/students/:id/add_document", to: "students#add_document", as: :add_document
  post "/update_book_page_saver", to: "books#update_current_page"

  # Relatories routes
  get "/relatories", to: "relatories#index", as: :relatories
  get "/relatories/appointments", to: "relatories#appointments", as: :appointments_relatory
  get "/relatories/occurrencies", to: "relatories#occurrencies", as: :occurrencies_relatory
  get "/relatories/print_appointments/:ids", to: "relatories#print_appointments", as: :print_appointments_relatory
  get "/relatories/print_occurrencies/:ids", to: "relatories#print_occurrencies", as: :print_occurrencies_relatory
end
