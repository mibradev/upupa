# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get "login", to: "devise/sessions#new", as: "new_user_session"
    post "login", to: "devise/sessions#create", as: "user_session"
    delete "logout", to: "devise/sessions#destroy", as: "destroy_user_session"
  end

  devise_for :users, skip: :sessions
  root to: "home#index"
end
