class PatientsController < ApplicationController
  def index
  end

  def create
  end

  private

  def patient_params
    # params.require(:patient).permit(:call_result)
  end
end
