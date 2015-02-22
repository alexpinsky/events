Events::Application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

  root 'pages#comming_soon'

  devise_for :users, controllers: { 
    registrations: 'devise_ext/registrations'
  }

  get 'ping'    => 'pages#ping'
  get 'welcome' => 'pages#welcome'

  scope '/admin' do
    authenticate :user, lambda { |u| u.admin? } do
      resources :leads
    end
  end
  namespace :admin do
    authenticate :user, lambda { |u| u.admin? } do
      resources :events, only: :index
    end
  end

  resources :categories
  resources :events do
    member do 
      get 'reload_preview'
      get 'publish'
    end
  end
  resources :leads, only: :create

  
  get '/:url', to: 'events#show'
end
