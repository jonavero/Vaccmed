Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
   #ruta mensaje
   #get '/tutors/message' => 'tutors#mensaje'

    #Rutas para usuario
    get 'users/index'
    get 'users/show'
    get 'users/create'
    post 'user_token' => 'user_token#create'
    get 'users/current' => 'users#current'
    resources :users

    #rutas para roles
    resources :roles
    get '/rol/list' => 'roles#index'

    #rutas para Sucursales
    resources :branch_offices
    get '/branchOffice/list' => 'branch_offices#showByStatus'

    #Rutas para colaboradores
    resources :collaborators

    #rutas para vacunas
    resources :vaccines
    put '/vaccines/status/:id' => 'vaccines#updateStatus', as: :UpdateStatus

    # Rutas para Tutores
     resources :tutors
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
