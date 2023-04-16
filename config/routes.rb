Rails.application.routes.draw do
  devise_for :users
  get "pages/index"
  get "sign-in-development/:id", to: "pages#sign_in_development", as: :sign_in_development
  post "pages/select_kindergarten", to: "pages#select_kindergarten"
  get "pages/step1", to: "pages#step1"
  get "pages/step2", to: "pages#step2"
  post "pages/step1_post", to: "pages#step1_post"
  post "pages/step2_post", to: "pages#step2_post"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "pages#index"
end
