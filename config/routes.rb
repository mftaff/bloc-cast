Rails.application.routes.draw do
  devise_for :users
  get '/show' => 'bloc_cast#show'
  get '/search' => 'bloc_cast#search'

  root to: 'bloc_cast#index'
end
