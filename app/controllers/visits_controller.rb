class VisitsController < ApplicationController
  include Searchable

  self.permitted_attrs = %i[patient_id]

  private

  def serilizer_class
    VisitSerializer
  end

  def query_object
    VisitsQuery.new(model_params)
  end
end
