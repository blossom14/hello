Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'users/sessions',
                     registrations: 'users/registrations'}
  resources :users
  resources :maps
  resources :messages, only: [:index]
  resources :sessions, only: [:new, :create]
  resources :friendships, only: [:create, :destroy]
  

  root 'welcome#index'

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 