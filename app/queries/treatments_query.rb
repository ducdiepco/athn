class TreatmentsQuery
  attr_reader :relation, :params

  def initialize(params = {}, relation = Treatment.includes(:medication))
    @relation = relation
    @params = params
  end

  def for_patient
    relation.where(patient_id: params[:patient_id])
  end
end
