Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'welcome#index'
  devise_for :users

  resources :users 
  
  get "/subscription", to: "posts#subscription"
  get "/payment",to: "posts#payment"
  post "/success",to: "posts#success"
  get "/pay",to: "posts#pay"
  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments, except: [:destroy]  do 
      get :new_reply 
      post :create_reply
    end
  end
  
  resources :posts do
    resources :likes 
  end

  resources :comments, except: [:destroy]   do
    resources :likes
  end

  resources :comments, only: [:destroy]

  resources :notifications

end
