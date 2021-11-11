Rails.application.routes.draw do
  get 'messages/reply'
  get 'comments/index'
  root to: 'welcome#index'
  devise_for :users

  resources :users

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
    get :generate_pdf
    resources :likes

  end

  resources :comments, except: [:destroy]   do
    resources :likes
  end

  resources :comments, only: [:destroy]
 

 resource :messages do
  collection do
    post 'reply'
  end
end
end
