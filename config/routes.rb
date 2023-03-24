# frozen_string_literal: true

Rails.application.routes.draw do
  get "pages/index"
  get "sign-in-development/:id", to: "pages#sign_in_development", as: :sign_in_development
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
