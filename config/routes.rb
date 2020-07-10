Rails.application.routes.draw do
  devise_for :users

  resources :articles do
    resources :comments, only: [:create, :destroy]
  end

  root 'articles#index'
end
