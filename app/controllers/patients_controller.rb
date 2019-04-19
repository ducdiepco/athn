class PatientsController < ApplicationController
  self.permitted_attrs = %i[id first_name last_name email]

  private

  def serilizer_class
    PatientSerializer
  end

  def query_object
    PatientsQuery.new(model_params)
  end
end
