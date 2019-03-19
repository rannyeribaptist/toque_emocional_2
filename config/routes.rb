Rails.application.routes.draw do
  resources :books

  authenticated :guests do
    resources :book_comments
    resources :guests
  end

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
    resources :phrases
    resources :guests
  end

  root to: "application#index"

  get "slides", to: "application#slides", as: :slide_show
  get "about", to: "application#about", as: :about_page
  get "soon", to: "application#soon", as: :soon
  post "/books/generate_access_cards", to: "books#generate_access_cards", as: :generate_access_cards

  patch "/books/:id/print_access_cards", to: "books#print_access_cards", as: :print_access_cards
  get "/books/:id/print_access_cards", to: "books#print_access_cards"

  get "/livro/:url", to: "books#read", as: :read_book
  patch "/books/:id/book_comments", to: "books#new_book_comments", as: :new_book_comments
  delete "/book_comments/:id", to: "books#destroy_book_comments", as: :delete_comment
  get "/livros", to: "books#list", as: :books_list
end
