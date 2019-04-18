class ApplicationController < ActionController::API

  protected

  def render_no_results_error
    render json: { error: "No results found" }, status: :not_found
  end
end
