Events::Application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

  devise_for :users, controllers: { 
    registrations: 'devise_ext/registrations'
  }
  
  root 'pages#comming_soon'
  get 'comming_soon' => 'pages#comming_soon'

  resources :events do
    member do 
      get 'reload_preview'
      get 'publish'
    end
  end

  resources :categories
  resources :leads
end
