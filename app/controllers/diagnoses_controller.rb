class DiagnosesController < ApplicationController
  private

  def serilizer_class
    DiagnosisSerializer
  end

  def query_object
    DiagnosesQuery.new(model_params)
  end
end
