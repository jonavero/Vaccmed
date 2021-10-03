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
    get '/loginPatient' => 'users#current'
    get '/login' => 'users#current'


    resources :users
    resources :user_tutors


    #rutas para roles
    resources :roles
    get '/rol/list' => 'roles#index'
    get '/role/list' => 'roles#index'


    #rutas para Sucursales
    resources :branch_offices
    get '/branchOffice/list' => 'branch_offices#showByStatus'
    put '/branch_offices' =>'branch_offices#update'


    #Rutas para colaboradores
    resources :collaborators
    put '/collaborators' =>'collaborators#update'

    #rutas para vacunas
    resources :vaccines
    put '/vaccines/status/:id' => 'vaccines#updateStatus', as: :UpdateStatus
    put '/vaccines' =>'vaccines#update'
    get '/list/vaccine' =>'vaccines#vaccineList'


    # Rutas para Tutores
     resources :tutors
    get '/tutor/dependent' => 'tutors#tutorDepend'
    get '/turn' => 'tutors#turn'
    get '/tutor/listForName' => 'tutors#index'
    put '/tutors' =>'tutors#update'


    #rutas para pacientes
    resources :patients
    get '/patient/tutor' => 'patients#PatientTutor'
    get '/patient/listForName' => 'patients#showForName'
    get 'vaccine/card' =>'patients#vaccineCard'
    put '/patients' =>'patients#update'




    #rutas relationship (Parentesco)
    get '/relationships' => 'relationships#index'
    post '/relationships' => 'relationships#create'

   #rutas para dependientes
   post '/dependent' => 'dependets#create'

    #rutas para Appointment (Citas)
     resources :appointments
    #post '/appointments' => 'appointments#create'
   get '/appointment/counter' => 'appointments#counterAppointment'
    get '/vaccine/list' => 'appointments#showVaccineList'
    get 'patient/appointment' => 'appointments#patientAppointment'
    get '/appointment/tutor' => 'appointments#tutorAppointment'
    put '/appointment/status/:id' => 'appointments#updateStatusAppointment', as: :UpdateStatusAppointment
    put '/appointment/update' => 'appointments#updateGeneral'

  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
