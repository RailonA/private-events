Rails.application.routes.draw do

  resources :events do
    resources :invitations
 end
  devise_for :users
  resources :users, only: [:new, :create, :show, :index] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

root "events#index"
end
