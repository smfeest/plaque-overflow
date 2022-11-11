# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get '/log-in', to: 'sessions#new'
  post '/log-in', to: 'sessions#create'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
end
