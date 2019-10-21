Rails.application.routes.draw do
  get 'players/name'
  get 'players/position'
  get 'players/fifa_rating'
  get 'players/team_id'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teams, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :lineups
  resources :lineup_players
  resources :comments
  resources :likes
  resources :users, only: [:create, :index, :update]
      post '/login', to: 'sessions#create'
      get '/login', to: 'sessions#index'
      get '/profile', to: 'users#profile'
    end
