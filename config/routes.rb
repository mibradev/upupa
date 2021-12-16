Rails.application.routes.draw do
  root to: "home#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :roles

  resources :users do
    scope module: :users do
      resources :roles, only: :create
    end
  end

  resources :word_counts do
    resources :word_count_files
  end

  resources :work_files
  resources :work_types
end
