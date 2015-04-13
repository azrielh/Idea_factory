Rails.application.routes.draw do

  devise_for :users

  root "ideas#index"

  resources :ideas do

    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :joins, only: [:create, :destroy]

  end

  resources :joins, only: [:index]

end
