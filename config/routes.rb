CapistranoDeploy::Application.routes.draw do
  get "admin/index"
  get "admin/vta_origen_toxls"
  get "owner/index"
  get "owner/create"
  get "owner/new"
  get "owner/edit"
  get "owner/update"
  get "center/index"
  get "center/new"
  post "center/create"
  get "center/edit"
  post "center/update"
  post "center/chandge_status"
  resources :events

  get "telephony/index"
  resources :comments

  resources :owner_centers

  devise_for :users
  root to: "home#index"
  get "home/index"

  match 'api/v1/sessions/login', to: 'api/v1/sessions#options', as: :sessions_login_options, via: :options
  match 'api/v1/sessions/logout', to: 'api/v1/sessions#options', as: :sessions_logout_options, via: :options

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :owner_centers do
        collection do
          get :actualize_center
          get :create_new_owner
        end
      end
      resources :sessions do
        collection do
          post :login
          post :logout
        end
      end
      resources :home do
        collection do
          get :index 
          get :centers
        end
      end
    end
  end

end
