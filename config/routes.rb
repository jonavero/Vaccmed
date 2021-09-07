Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    get 'users/index'
    get 'users/show'
    get 'users/create'
    post 'user_token' => 'user_token#create'
    get 'users/current' => 'users#current'
    resources :users
    resources :roles
    resources :branch_offices
    resources :collaborators
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
