Events::Application.routes.draw do
  root 'pages#welcome'

  devise_for :users, controllers: {
    registrations: 'devise_ext/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  get 'welcome',          to: 'pages#welcome'
  get 'app/*page',        to: 'pages#app'
  get 'admin',            to: 'pages#admin'
  get 'about',            to: 'pages#about'
  get 'privacy_policy',   to: 'pages#privacy_policy'
  get 'terms_of_service', to: 'pages#terms_of_service'
  get 'play',             to: 'pages#play'

  resources :categories, path: 'templates'
  resources :events do
    member do
      put 'publish'
      put 'unpublish'
    end
  end
  resources :pictures, only: :destroy
  resources :contact_requests, only: [:new, :create]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :events
      resources :categories
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

  get '/:url', to: 'events#show'
end
