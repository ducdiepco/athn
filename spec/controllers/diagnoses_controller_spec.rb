require 'rails_helper'

RSpec.describe DiagnosesController, type: :api do
  describe 'GET index /diagnoses/' do
    subject { get 'diagnoses' }

    context 'when data exists' do
      let!(:diagnoses) { create_list(:diagnosis, 5) }
      it 'return a list of available diagnoses' do
        subject
        expect(json.count).to eq(5)
        diagnosis = json.first
        expect(diagnosis['name']).not_to eq(nil)
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
