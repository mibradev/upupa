Rails.application.routes.draw do
  root to: "home#index"

  resources :word_counts do
    resources :word_count_files
  end

  resources :work_files
  resources :work_types
end
