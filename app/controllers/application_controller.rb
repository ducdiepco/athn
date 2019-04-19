class ApplicationController < ActionController::API

  class_attribute :permitted_attrs

  protected

  def render_no_results_error
    render json: { error: "No results found" }, status: :not_found
  end

  def model_params
    params.permit(permitted_attrs)
  end
end
