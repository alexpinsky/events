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
  get '/:url', to: 'events#show'

  resources :categories
  resources :events do
    member do 
      get 'reload_preview'
      get 'publish'
    end
  end
  resources :leads, only: :create
  
  scope '/admin' do
    authenticate :user, lambda { |u| u.admin? } do
      resources :leads, only: :index
    end
  end

  namespace :admin do
    authenticate :user, lambda { |u| u.admin? } do
      resources :events, only: :index
    end
  end
end
