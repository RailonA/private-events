Rails.application.routes.draw do

  resources :users, only: %i[new create show index]
  resources :sessions, only: %i[new create destroy]
  resources :events
  resources :invitations



  # get 'invitations',  to:"invitations#new"

  root 'events#index'

  #  delete 'logout' => 'sessions#destroy'
end