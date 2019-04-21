require "rails_helper"

RSpec.describe PatientWithTreatmentsForm do
  describe '#save' do
    subject(:create_patient) { described_class.new(params).save }

    let(:params) do
      {
        first_name: 'first',
        last_name: 'last',
        email: 'email@email.com',
        treatments: [
          {
            medication_id: create(:medication).id,
            dosage: '1000IU / day',
            start_date: Date.today
          },
          {
            medication_id: create(:medication).id,
            dosage: '1000IU / day',
            start_date: Date.today
          }
        ]
      }
    end

    context 'create success' do
      it 'returns new patient' do
        expect(DoSomething).to receive(:call).with(any_args)
        expect(create_patient.id).not_to eq nil
        expect(create_patient.treatments.count).to eq 2
      end
    end

    context 'create failed' do
      context 'missing email' do
        it 'return an error' do
          params.except!(:email)
          expect(create_patient.errors.messages[:email]).to eq ["can't be blank"]
        end
      end

      context 'duplicate email' do
        it 'raises an error' do
          create(:patient, email: 'email@email.com')
          expect { create_patient }.to raise_error(
            ActiveRecord::RecordInvalid,
            "Validation failed: Email has already been taken",
          )
        end
      end

      context 'medical id does not exist' do
        it 'raises an error and rollback a transaction' do
          params[:treatments].last[:medication_id] = 999
          expect { create_patient }.to raise_error(
            ActiveRecord::RecordInvalid,
            "Validation failed: Medication must exist",
          )
          expect(Patient.all.count).to eq 0
          expect(Treatment.all.count).to eq 0
        end
      end
    end
  end
end
