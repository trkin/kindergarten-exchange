Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root "pages#index"
  devise_for :users
  get "sign-in-development/:id", to: "pages#sign_in_development", as: :sign_in_development
  resources :pages, only: :index
  get "contact", to: "pages#contact_new"
  post "contact", to: "pages#contact_create"
end
