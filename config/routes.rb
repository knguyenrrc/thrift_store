Rails.application.routes.draw do
  get 'publisher/index'
  get 'publisher/show'
  get 'subject/index'
  get 'subject/show'
  get 'book/index'
  get 'book/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
