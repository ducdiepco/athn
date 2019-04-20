require 'rails_helper'

RSpec.describe TreatmentsController, type: :api do
  let(:patient) { create(:patient) }


  describe 'GET for_patient /patient/<patient id>/treatments' do
    subject { get "patient/#{patient.id}/treatments" }

    context 'when data exists' do
      let!(:treatments) { create_list(:treatment, 5, patient: patient) }

      it 'returns a list of treatments associated with this patient' do
        subject
        expect(json.count).to eq 5
        treatment = json.first
        expect(treatment['dosage']).not_to eq(nil)
        expect(treatment['medication']['medication_name']).not_to eq(nil)
      end
    end

    context 'when data does not exist' do
      it 'returns error with 404 status' do
        subject
        expect(json['error']).to eq 'No results found'
        expect(response_status).to eq 404
      end
    end
  end
end
