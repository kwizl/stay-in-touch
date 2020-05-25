Rails.application.routes.draw do

  resources :friendships, only: [:index, :create, :destroy]
  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  get 'user_invitations' => 'users#user_invitations', as: :user_invitations
  post 'confirm_friend' => 'users#confirm_friend'
  post 'reject_friend' => 'users#reject_friend'
  post 'send_invitation' => 'friendships#create'
  post 'cancel_invitation' => 'friendships#destroy'
end
