Rails.application.routes.draw do
  #mount RailsAdmin::Engine => '/ral s', as: 'rails_admin'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :messages
  resources :products
  devise_for :users
  #get '/archive', to: 'archives#index', as: 'archives'
  #get '/archive/new/', to: 'archives#new', as: 'new_archive'
  #post '/archive/new(:id)', to: 'archives#create'
  resources :archives
  root 'home#index'
  get 'home/private'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  match '/404', to: 'errors#not_found', via: :all
  get '/500', to: 'errors#server_errors', via: :all


end
