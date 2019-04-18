module Searchable
  extend ActiveSupport::Concern
  included do
    def for_patient
      results = query_object.for_patient
      if results.count > 0
        render json: results, each_serializer: serilizer_class
      else
        render_no_results_error
      end
    end
  end
end
