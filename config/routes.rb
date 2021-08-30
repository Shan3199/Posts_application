Rails.application.routes.draw do
  get 'comments/index'
  root to: 'welcome#index'
  devise_for :users
  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments do 
      get :new_reply 
      post :create_reply
    end
  end

  resources :posts do
    resources :likes
  end

  resources :comments, only: [] do
    resources :likes
  end

  # resources :comments, only: [] do
  #   # post 'add_to_cart/:product_id', to: 'orders#add_to_cart', as: 'add_to_cart'
  #     post 'comment_reply', to: 'comments#comment_reply', as: 'comment_reply'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
