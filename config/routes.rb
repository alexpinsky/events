Events::Application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

  root 'pages#welcome'

  devise_for :users, controllers: {
    registrations: 'devise_ext/registrations'
  }

  get 'welcome'          => 'pages#welcome'
  get 'admin'            => 'pages#admin'
  get 'about'            => 'pages#about'
  get 'privacy_policy'   => 'pages#privacy_policy'
  get 'terms_of_service' => 'pages#terms_of_service'
  get 'ping'             => 'pages#ping'
  get 'react'            => 'pages#react'
  post 'image'            => 'pages#image'

  resources :categories, path: 'templates'
  resources :events do
    member do
      put 'publish'
      put 'unpublish'
    end
  end
  resources :pictures, only: :destroy
  resources :contact_requests, only: [:new, :create]

  namespace :admin do
    authenticate :user, lambda { |u| u.admin? } do
      resources :events, only: :index do
        member do
          put 'publish'
          put 'unpublish'
        end
      end
      resources :contact_requests, only: [:index, :show]
      resources :users, only: :index
    end
  end

  get '/:url', to: 'events#show'
end
