require 'rails_helper'

RSpec.describe VisitsQuery  do
  describe '#for_patient' do
    subject(:all){ described_class.new(params).for_patient }

    let(:patient) { create(:patient) }
    let(:params) {
      { patient_id: patient.id }
    }

    context 'when patient has visits' do
      before { create_list(:visit, 5, patient: patient) }
      it 'returns a list of visits associated with this patient' do
        expect(all.size).to eq 5
      end
    end

    context "when patient doesn't have visits" do
      it 'returns empty' do
        expect(all.size).to eq 0
      end
    end
  end
end
