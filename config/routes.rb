Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}

  get "sign_up", to: "registration#new"
  get "sign-in-development/:id", to: "pages#sign_in_development", as: :sign_in_development
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  root "pages#index"
  resources :wishes, only: [:index, :create, :destroy] do
    resources :wish_kindergartens, only: [:index, :create, :destroy]
  end

  get "/wishes/:wish_id/registration", to: "registration#index", as: "registration"
  post "/wishes/:wish_id/registration", to: "registration#create"

  # resources :kindergartens, only: [:index], defaults: { format: 'json' }

  get "wishes", to: "wishes#index"
  get "contact", to: "pages#contact_show"
  post "contact", to: "pages#contact_create", as: "contact_submit"
end
