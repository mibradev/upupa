Rails.application.routes.draw do
  devise_scope :user do
    get "login", to: "devise/sessions#new", as: "new_user_session"
    post "login", to: "devise/sessions#create", as: "user_session"
    delete "logout", to: "devise/sessions#destroy", as: "destroy_user_session"
  end

  devise_for :users, skip: :sessions
  root to: "home#index"
end
