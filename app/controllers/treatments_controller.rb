class TreatmentsController < ApplicationController
  include Searchable

  private

  def serilizer_class
    TreatmentSerializer
  end

  def query_object
    TreatmentsQuery.new(filtered_params)
  end

  def filtered_params
    params.permit(:patient_id)
  end
end
