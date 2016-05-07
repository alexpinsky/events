Events::Application.routes.draw do
  root 'pages#welcome'

  devise_for :users, controllers: {
    registrations: 'devise_ext/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # STATIC PAGES
  get 'app/*page',        to: 'pages#app', as: :app
  get 'welcome',          to: 'pages#welcome'
  get 'admin',            to: 'pages#admin'
  get 'about',            to: 'pages#about'
  get 'privacy_policy',   to: 'pages#privacy_policy'
  get 'terms_of_service', to: 'pages#terms_of_service'

  # API
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :events do
        member do
          put 'publish'
          put 'unpublish'
        end
        resources :views, only: :create
      end
      resources :categories
      resources :files, only: :destroy
    end
  end

  # ADMIN
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

  resources :categories, path: 'templates'
  resources :contact_requests, only: [:new, :create]
  resources :events, only: :show

  get '/*url', to: 'events#show'
end
