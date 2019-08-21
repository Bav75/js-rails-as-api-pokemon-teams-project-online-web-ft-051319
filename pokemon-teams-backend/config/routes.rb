Rails.application.routes.draw do
  # resources :pokemons
  resources :trainers, only: [:index]
  post "/pokemons", to: "pokemons#create"
  delete "/pokemons/:pokemon_id", to: "pokemons#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
