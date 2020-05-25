Rails.application.routes.draw do

  get 'friendships/create'
  get 'friendships/destroy'
  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  
  get 'user_invitations' => 'users#user_invitations', as: :user_invitations
  get "friends/user" => "users#friends_user", as: :friends_user
  post 'accept/user' => 'users#accept', as: :accept_user
  post 'reject/user' => 'users#reject', as: :reject_user 
  post 'send_invitation' => 'friendships#create'
  post 'cancel_invitation' => 'friendships#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
