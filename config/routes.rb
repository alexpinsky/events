Events::Application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

  devise_for :users, controllers: { 
    registrations: 'devise_ext/registrations'
  }
  
  root 'pages#comming_soon'
  
  get 'welcome' => 'pages#welcome'

  resources :leads, only: :create
  scope '/admin' do
    authenticate :user, lambda { |u| u.admin? } do
      resources :leads
    end
  end

  resources :events do
    member do 
      get 'reload_preview'
      get 'publish'
    end
  end

  resources :categories
  
  get '/:name', to: 'events#show'
end
