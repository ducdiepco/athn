require 'rails_helper'

RSpec.describe MedicationsController, type: :api do
  describe 'GET index /medications/' do
    subject { get 'medications' }

    context 'when data exists' do
      let!(:medications) { create_list(:medication, 5) }

      it 'returns a list of available medications' do
        subject
        expect(json.count).to eq(5)
        medication = json.first
        expect(medication['medication_name']).not_to eq(nil)
      end
    end

    context 'when data does not exist' do
      it 'return an error and 404 status' do
        subject
        expect(response_status).to eq 404
        expect(json['error']).to eq 'No results found'
      end
    end
  end
end
