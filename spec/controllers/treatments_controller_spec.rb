require 'rails_helper'

RSpec.describe TreatmentsController, type: :api do
  let(:patient) { create(:patient) }
  let!(:treatments) { create_list(:treatment, 5, patient: patient) }


  describe 'GET for_patient /patient/<patient id>/treatments' do
    context 'test' do
      before { get "patient/#{patient.id}/treatments" }

      it 'returns a list of treatments associated with this patient' do
        expect(json.count).to eq 5
      end
    end
  end
end
