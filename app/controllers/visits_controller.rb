class VisitsController < ApplicationController
  include Searchable

  private

  def serilizer_class
    VisitSerializer
  end

  def query_object
    VisitsQuery.new(filtered_params)
  end

  def filtered_params
    params.permit(:patient_id)
  end
end
