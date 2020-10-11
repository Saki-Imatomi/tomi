Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'posts#index'

  get 'messages' => 'messages#index'
  
 

  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :posts do
    resources :loves, only: [:create, :destroy]
    resources :dogs, only: [:create]
  end

end
