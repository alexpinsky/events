Events::Application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

  root 'pages#welcome'

  devise_for :users, controllers: {
    registrations: 'devise_ext/registrations'
  }

  get 'ping'        => 'pages#ping'
  get 'welcome'     => 'pages#welcome'
  get 'coming_soon' => 'pages#comming_soon'

  resources :categories
  resources :events do
    member do
      put 'publish'
      put 'unpublish'
    end
  end
  resources :leads, only: :create
  resources :contact_requests, only: [:new, :create]

  scope '/admin' do
    authenticate :user, lambda { |u| u.admin? } do
      resources :leads, only: :index
      resources :contact_requests, except: [:new, :create]
    end
  end

  namespace :admin do
    authenticate :user, lambda { |u| u.admin? } do
      resources :events, only: :index
    end
  end

  get '/:url', to: 'events#show'
end
