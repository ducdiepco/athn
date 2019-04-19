class MedicationsController < ApplicationController
  private

  def serilizer_class
    MedicationSerializer
  end

  def query_object
    MedicationsQuery.new(model_params)
  end
end
