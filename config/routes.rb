Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users

  resources :maps

  resources :messages, only: [:index]

  resources :sessions, only: [:new, :create]

  resources :friendships, only: [:index, :create, :update, :destroy] do
    member do
      get :messages
    end
  end

  root 'welcome#index'

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 