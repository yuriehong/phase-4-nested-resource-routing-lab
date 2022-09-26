Rails.application.routes.draw do
  resources :items, only: [:index] do
    resources :users, only: [:show]
  end

  resources :users, only: [:show] do
    resources :items, only: [:index]
  end
end
