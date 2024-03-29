Rails.application.routes.draw do
  devise_for :users
  get "pages/index"
  get "sign-in-development/:id", to: "pages#sign_in_development", as: :sign_in_development
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  root "pages#index"
  get "kindergarten", to: "pages#kindergarten"
  get "contact", to: "pages#contact_show"
  post "contact", to: "pages#contact_create", as: "contact_submit"
end
