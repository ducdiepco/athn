class PatientDiagnosesQuery
  attr_reader :relation, :params

  def initialize(params = {}, relation = PatientDiagnosis.includes(:diagnosing_provider, :diagnosis))
    @relation = relation
    @params = params
  end

  def for_patient
    relation.where(patient_id: params[:patient_id])
  end
end
