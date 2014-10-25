Rails.application.routes.draw do
  
  resources :candidates

  devise_for :users
  root 'candidates#index'

  # Voting
  post '/candidates/:id/vote', to: 'candidates#vote', as: 'vote'
  get '/set_cookie', to: 'candidates#set_cookie'
  
end
