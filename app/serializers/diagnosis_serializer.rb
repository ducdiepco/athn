class DiagnosisSerializer < ActiveModel::Serializer
  attributes :id, :name

  def name
    object.diagnosis
  end
end
