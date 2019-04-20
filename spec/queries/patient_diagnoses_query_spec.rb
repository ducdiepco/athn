require 'rails_helper'

RSpec.describe PatientDiagnosesQuery  do
  describe '#for_patient' do
    subject(:all){ described_class.new(params).for_patient }

    let(:patient) { create(:patient) }
    let(:params) {
      { patient_id: patient.id }
    }

    context 'when patient has diagnoses' do
      before { create_list(:patient_diagnosis, 5, patient: patient) }
      it 'returns a list of diagnoses associated with this patient' do
        expect(all.size).to eq 5
      end
    end

    context "when patient doesn't have diagnoses" do
      it 'returns empty' do
        expect(all.size).to eq 0
      end
    end
  end
end
