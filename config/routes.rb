 Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  
  resources :blogs, only: [:create, :update, :destroy, :new, :index, :edit]
  resources :users, only: [:show]
 end