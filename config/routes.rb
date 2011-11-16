FriendApplication::Application.routes.draw do
  root to: 'friend_requests#new'
  resources :friend_requests, only: [:new, :create]
end
