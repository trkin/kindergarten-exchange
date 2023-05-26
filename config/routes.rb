Rails.application.routes.draw do
  devise_for :users

  get "sign_up", to: "registration#new"
  get "sign-in-development/:id", to: "pages#sign_in_development", as: :sign_in_development
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  # root "pages#index"
  # post "/", to: "pages#create_wish", as: "create_wish"
  # get "move", to: "pages#move"
  # post "move", to: "pages#create_move", as: "create_move"
  root to: redirect('/wishes')
  resources :wishes, only: [:index, :create] do
    resources :wish_kindergartens, only: [:index, :create]
  end

  # resources :wish_kindergartens, only: [:index, :create, :destroy], param: :wish_id
  get "wishes", to: "wishes#index"
  get "contact", to: "pages#contact_show"
  post "contact", to: "pages#contact_create", as: "contact_submit"
end
