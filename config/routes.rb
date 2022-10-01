Rails.application.routes.draw do
  get 'projects/index'
  resources :projects do
    resources :tasks do
      member do
        patch :complete
      end
    end
  end
  root "welcome#index"
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
end
