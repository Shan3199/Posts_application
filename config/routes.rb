Rails.application.routes.draw do
  get 'comments/index'
  root to: 'welcome#index'
  devise_for :users

  resources :users 
  get "/subscribe",to: "posts#subscribe"
  get "/sub", to: "posts#sub"
  get "/pay", to: "posts#pay"
  get "/payment",to: "posts#payment"
  post "/success",to: "posts#success"
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
