Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pokemons#index'
  resources :pokemons, only: [:index]

  post 'list', to: 'pokemons#list'
  get 'list', to: 'pokemons#list'

  post 'upload', to: 'pokemons#upload'
  delete 'destroy', to: 'pokemons#destroy'
end
