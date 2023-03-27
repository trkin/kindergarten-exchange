# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  get "sign-in-development/:id", to: "pages#sign_in_development", as: :sign_in_development
  get "pages/index"
  root "pages#index"
end
