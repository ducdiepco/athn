class TreatmentsController < ApplicationController
  include Searchable

  self.permitted_attrs = %i[patient_id]

  private

  def serilizer_class
    TreatmentSerializer
  end

  def query_object
    TreatmentsQuery.new(model_params)
  end
end
