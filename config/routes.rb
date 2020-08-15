Rails.application.routes.draw do
  get 'static_pages/imprint'
  resources :questions do
    member do
      get :answer
      post :check_answer
    end
  end
  
  root to: 'questions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
