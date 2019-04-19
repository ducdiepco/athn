Rails.application.routes.draw do
  get 'patients', to: 'patients#index'

  get 'medications', to: 'medications#index'

  get 'diagnoses', to: 'diagnoses#index'

  post 'patient', to: 'patients#create'

  get 'patient/:id', to: 'patients#show'

  get 'patient/:patient_id/treatments', to: 'treatments#for_patient'

  get 'patient/:patient_id/diagnoses', to: 'patient_diagnoses#for_patient'

  get 'patient/:patient_id/visits', to: 'visits#for_patient'
end
