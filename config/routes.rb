Events::Application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#welcome'

  get '/:id', to: redirect('/events/%{id}')
  get '/events/:id', to: 'events#show'

  resources :users do
    resources :events, only: [:index, :show, :create, :edit, :update, :destroy] do
      member do 
        get 'reload_preview'
      end
    end
  end
end
