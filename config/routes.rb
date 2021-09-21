Rails.application.routes.draw do


  get 'appointments/index'
  get 'appointments/show'
  get 'appointments/create'
  get 'appointments/update'
  get 'appointments/destroy'
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
    get '/tutor/dependent' => 'tutors#tutorDepend'

    #rutas para pacientes
    resources :patients
    get '/patient/tutor' => 'patients#PatientTutor'
    get '/patient/listForName' => 'patients#showForName'



    #rutas relationship (Parentesco)
    get '/relationships' => 'relationships#index'
    post '/relationships' => 'relationships#create'

   #rutas para dependientes
   post '/dependent' => 'dependets#create'

    #rutas para Appointment (Citas)
     resources :appointments
    #post '/appointments' => 'appointments#create'
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
