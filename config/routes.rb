Rails.application.routes.draw do
  devise_for :users
  get "pages/index"
  get "sign-in-development/:id", to: "pages#sign_in_development", as: :sign_in_development
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  
  devise_scope :user do
    authenticated :user do
      root 'pages#index', as: :authenticated_root
    end
    
    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  root "pages#index"
  end
