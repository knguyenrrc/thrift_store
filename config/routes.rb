Rails.application.routes.draw do
  # root "books#index"
  # get 'author/index'
  # get 'author/show'
  # get 'publisher/index'
  # get 'publisher/show', as: 'publisher'
  # get 'subject/index'
  # get 'subject/show'
  # get 'book/index'
  # resources :subject, only: [:index, :show]
  # resources :author, only: [:index, :show]
  # resources :publisher, only: [:index, :show]
  get "/books", to: "book#index", as: "books" # books_path
  get "/books/:id", to: "book#show", as: "book", constraints: { id: /\d+/ } # book_path

  get "/authors", to: "author#index", as: "authors" # authors_path
  get "/authors/:id", to: "author#show", as: "author", constraints: { id: /\d+/ } # author_path

  get "/publishers", to: "publisher#index", as: "publishers" # publishers_path
  get "/publishers/:id", to: "publisher#show", as: "publisher", constraints: { id: /\d+/ } # publisher_path

  get "/subjects", to: "subject#index", as: "subjects" # subjects_path
  get "/subjects/:id", to: "subject#show", as: "subject", constraints: { id: /\d+/ } # subject_path

  get "/about", to: "about#index", as: "about" # about_path
  resources :book, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  # get 'book/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
