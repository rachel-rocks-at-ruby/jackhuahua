Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update, :show, :index]
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :friendships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end
