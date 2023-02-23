Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/new'
  get 'bookmarks/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'movies', to: 'movies#index'

  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create destroy], shallow: true
  end
end
