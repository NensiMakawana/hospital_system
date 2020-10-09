Rails.application.routes.draw do
  resources :availibility_time_slots
  resources :appointments do
    collection do
      get 'doctor_wise_time_slots'
    end
  end
  resources :home, only: :index
  devise_for :patients, controllers: {
        sessions: 'patients/sessions',
        registrations: 'patients/registrations'
      }

  devise_scope :patient do
    authenticated  do
      root to: 'appointments#index', as: 'authenticated_patient_root'
    end

    unauthenticated do
      root to: 'home#index', as: 'unauthenticated_patient_root'
    end
  end

  devise_for :doctors, controllers: {
        sessions: 'doctors/sessions',
        registrations: 'doctors/registrations'
      }

  devise_scope :doctor do
    authenticated  do
      root to: 'appointments#index', as: 'authenticated_doctor_root'
    end

    unauthenticated do
      root to: 'home#index', as: 'unauthenticated_doctor_root'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
