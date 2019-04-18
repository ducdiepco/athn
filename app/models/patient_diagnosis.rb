class PatientDiagnosis < ApplicationRecord
  belongs_to :diagnosing_provider, class_name: 'Provider'
  belongs_to :patient
  belongs_to :diagnosis
end
