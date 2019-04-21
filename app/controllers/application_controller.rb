class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  class_attribute :permitted_attrs

  def index
    results = query_object.all
    if results.count > 0
      render json: results, each_serializer: serilizer_class
    else
      render_no_results_error
    end
  end

  def create(options = {}, &block)
    model_class.transaction do
      assign_attributes
      created = entry.save
      respond(created,
              options.merge(status: :created),
              &block)
      raise ActiveRecord::Rollback unless created
    end
  end

  def show
    render json: entry
  end

  protected

  def render_no_results_error
    render json: { error: "No results found" }, status: :not_found
  end

  def model_params
    params.permit(permitted_attrs)
  end

  def model_class
    @model_class ||= controller_name.classify.constantize
  end

  private

  def entry
    @entry ||= ( model_params[:id] ? find_entry : build_entry )
  end

  def find_entry
    model_class.find(params[:id])
  end

  def build_entry
    model_class.new
  end

  def assign_attributes
    entry.attributes = model_params
  end

  def respond(success, options)
    yield(success) if block_given?
    if success
      render json: {id: entry.id}, status: options[:status]
    else
      render json: entry.errors, status: :unprocessable_entity
    end
  end

  def render_404(e)
    render json: { error: 'Record not found' } , status: :not_found
  end

  def render_unprocessable_entity_response(exception)
    render json: exception.record.errors.messages, status: :unprocessable_entity
  end
end
