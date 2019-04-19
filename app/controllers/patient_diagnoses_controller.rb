class PatientDiagnosesController < ApplicationController
  include Searchable

  self.permitted_attrs = %i[patient_id]

  private

  def serilizer_class
    PatientDiagnosisSerializer
  end

  def query_object
    PatientDiagnosesQuery.new(model_params)
  end
end
