Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
 root to: 'toppages#index'
 
  get 'signup', to: 'users#new'
  
   get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users
   resources :posts, only: [:new, :create, :destroy, :show, :index] 
   
   
   
   resources :relationships, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
   
     resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :favorites
    end
  end
  
  
  
end
