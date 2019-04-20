require 'rails_helper'

RSpec.describe DiagnosesController, type: :api do
  let(:patient) { create(:patient) }

  describe 'GET for_patient /patient/<patient id>/diagnoses' do
    subject { get "patient/#{patient.id}/diagnoses" }

    context 'when data exists' do
      let!(:patient_diagnoses) { create_list(:patient_diagnosis, 5, patient: patient) }

      it 'returns a list of diagnoses associated with this patient' do
        subject
        expect(json.count).to eq 5
        patient_diagnosis = json.first
        expect(patient_diagnosis['diagnosis']['name']).not_to eq(nil)
        expect(patient_diagnosis['diagnosing_provider']['first_name']).not_to eq(nil)
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

