class PatientsController < ApplicationController
  self.permitted_attrs = [:id, :first_name, :last_name, :email,
                          treatments: [:medication_id, :dosage, :start_date] ]

  def create_with_treatments
    result = PatientWithTreatmentsForm.new(model_params).save
    if result.errors.count > 0
      render json: result.errors.messages, status: :unprocessable_entity
    else
      render json: result
    end
  end

  private

  def serilizer_class
    PatientSerializer
  end

  def query_object
    PatientsQuery.new(model_params)
  end
end
