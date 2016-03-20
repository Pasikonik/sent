Rails.application.routes.draw do
  devise_for :users

  root to: 'application#index'
  get '/' => 'application#index'

  resources :destinations
end
