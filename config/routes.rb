# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
end
