Rails.application.routes.draw do
  get 'work/index'
  get 'work/choose_theme'
  get 'work/display_theme'

  resources :users, only: [:show, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'main/index'
  get 'main/help'

  namespace :api, defaults: { format: :json } do
      match 'next_image',       to: 'api#next_image',   via: 'get'
      match 'prev_image',       to: 'api#prev_image',   via: 'get'
      match 'save_value',       to: 'api#save_value',   via: :get
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # work
  match 'work',             to: 'work#index',             via: :get
  match 'choose_theme',     to: 'work#choose_theme',      via: :get
  match 'display_theme',    to: 'work#display_theme',     via: :post
  match 'results_list',     to: 'work#results_list', via: :get

  match 'signup',   to: 'users#new',            via: 'get'
  match 'signin',   to: 'sessions#new',         via: 'get'
  match 'signout',  to: 'sessions#destroy',     via: 'delete'

  root 'main#index'
end
