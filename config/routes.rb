# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get '/log-in', to: 'sessions#new'
  post '/log-in', to: 'sessions#create'
  delete '/log-out', to: 'sessions#destroy'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
end
