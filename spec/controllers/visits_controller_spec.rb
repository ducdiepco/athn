require 'rails_helper'

RSpec.describe VisitsController, type: :api do
  let(:patient) { create(:patient) }


  describe 'GET for_patient /patient/<patient id>/visits' do
    subject { get "patient/#{patient.id}/visits" }

    context 'when data exists' do
      let!(:visits) { create_list(:visit, 5, patient: patient) }

      it 'returns a list of visits associated with this patient' do
        subject
        expect(json.count).to eq 5
        visit = json.first
        expect(visit['notes']).not_to eq(nil)
        expect(visit['provider']['office_address']).not_to eq(nil)
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
