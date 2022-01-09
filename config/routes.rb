Rails.application.routes.draw do
  root to: "home#index"

  controller :sessions do
    get "login", action: :new
    post "login", action: :create
    delete "logout", action: :destroy
  end

  resources :roles

  resources :users do
    scope module: :users do
      resources :roles, only: [:create, :destroy]
    end
  end

  resources :word_counts do
    resources :word_count_files
  end

  resources :work_files
  resources :work_types
end
