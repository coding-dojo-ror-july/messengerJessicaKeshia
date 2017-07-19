Rails.application.routes.draw do
  root 'users#index'
  post 'users' => 'users#create'
  post 'users/authenticate' => 'users#authenticate'
  get 'users/show' => 'users#show'
  get 'logout' => 'users#logout'
  get 'messages/show/inbox' => 'messages#inbox'
  get 'messages/new' => 'messages#new'
  post 'messages/:from_user/create' => 'messages#create'
  get 'messages/show/outbox' => 'messages#outbox'
end
