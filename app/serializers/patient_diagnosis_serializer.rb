class PatientDiagnosisSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date
  belongs_to :diagnosis, serializer: DiagnosisSerializer
  belongs_to :diagnosing_provider, class_name: 'Provider', serializer: ProviderSerializer
end
