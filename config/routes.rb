Rails.application.routes.draw do
  devise_for :users
  get 'prototype/index'
  root to: "prototypes#index"
  resources :prototypes do
  resources :comments, only: [:create]
 end
 resources :users, only: [:edit, :update, :show, :create]
end

