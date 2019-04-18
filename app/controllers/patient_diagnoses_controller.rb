class PatientDiagnosesController < ApplicationController
  include Searchable

  private

  def serilizer_class
    PatientDiagnosisSerializer
  end

  def query_object
    PatientDiagnosesQuery.new(filtered_params)
  end

  def filtered_params
    params.permit(:patient_id)
  end
end
