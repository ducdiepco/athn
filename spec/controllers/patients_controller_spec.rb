require 'rails_helper'

RSpec.describe PatientsController, type: :api do
  let(:patients) { create(:patient) }


  describe 'GET index /patients/' do
    before { get 'patients' }

    it 'returns a list of patients' do
      # need to do
    end
  end

  describe 'POST create /patient/' do
    it 'creates a new patient and returns the newly assigned patient ID number' do
      # need to do
    end
  end

  describe 'GET show /patient/<patient id>/' do
    let(:patient) { create(:patient) }
    before { get "patient/#{patient.id}" }

    it 'returns a particular patient' do
      # need to do
    end
  end
end
