class TreatmentSerializer < ActiveModel::Serializer
  attributes :id, :dosage, :start_date, :end_date
  belongs_to :medication, serializer: MedicationSerializer
end
