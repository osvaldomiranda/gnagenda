GnAgenda::Application.routes.draw do

  resources :services
  resources :notification_schedules
  resources :clients
  resources :notifications
  resources :notes
  resources :blocks
  resources :look_times
  resources :resources
 
  resources :kinesiologists
  resources :centers

  root to: "home#index"
  get "home/index"


  match 'api/v1/sessions/login', to: 'api/v1/sessions#options', as: :sessions_login_options, via: :options
  devise_for :users

  resources :schedules do
    collection do
      get :charge
      get :programing
      get :list
    end
    member do
      get :detail
    end
  end

  
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :sessions do
        collection do
          post :login
          post :logout
        end
      end     
    end
  end

end
