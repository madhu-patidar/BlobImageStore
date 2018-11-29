Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :devices
      resources :idle_times, only: [:index,:create]
      resources :training_sessions, only: [:index,:create] do
        collection do
          post :upload_image
          get :login
        end
      end
    end
  end

  resources :training_sessions
  resources :work_logs
  resources :idle_times, only: [:index,:create]
  root to: 'training_sessions#index'
end
