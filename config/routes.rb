Rails.application.routes.draw do
  resources :comments, only: [:index]
  
  #$SEQUENCE_IMPROTANT
  devise_for :users
  
  resources :users, only: [:show, :index] do
    member do
      post :follow
      delete :unfollow
    end
  end
  #/$SEQUENCE_IMPORTANT
  
  get 'prototype/feed'
  get 'static_pages/imprint'
  resources :questions do
    member do
      get :answer
      post :check_answer
    end
  end
  
  root to: 'prototype#feed'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
