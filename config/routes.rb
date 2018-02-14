Rails.application.routes.draw do
  get '/show' => 'bloc_cast#show'
  get '/search' => 'bloc_cast#search'

  root 'bloc_cast#index'
end
