require 'rails_helper'

RSpec.describe PatientsController, type: :api do


  describe 'GET index /patients/' do
    subject { get 'patients' }

    context 'when data exists' do
      let!(:patients) { create_list(:patient, 5) }

      it 'returns a list of patients' do
        subject
        expect(json.count).to eq(5)
        patient = json.first
        expect(patient['id']).not_to eq(nil)
        expect(patient['first_name']).not_to eq(nil)
        expect(patient['last_name']).not_to eq(nil)
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

  describe 'POST create /patient/' do
    let(:params) do
      {
        first_name: 'first',
        last_name: 'last',
        email: 'test@test.com'
      }
    end

    subject { post 'patient', params }

    context 'Create success' do
      it 'creates a new patient and returns the newly assigned patient ID number' do
        subject
        expect(json['id']).not_to eq nil
      end
    end

    context 'Create failed' do
      context 'missing email' do
        it 'returns an error' do
          params.except!(:email)
          subject
          expect(json['email']).to eq ["can't be blank"]
        end
      end

      context 'duplicate email' do
        let(:patient) { create(:patient) }
        it 'returns an error' do
          params[:email] = patient.email
          subject
          expect(json['email']).to eq ["has already been taken"]
        end
      end
    end
  end

  describe 'GET show /patient/<patient id>/' do
    before { get "patient/#{patient.id}" }

    context 'Patient exists' do
      let(:patient) { create(:patient) }

      it 'returns a particular patient' do
        expect(json['id']).not_to eq nil
        expect(json['email']).not_to eq nil
        expect(json['first_name']).not_to eq nil
        expect(json['last_name']).not_to eq nil
      end
    end

    context 'Patient does not exist' do
      let(:patient) { double(:patient, id: 9999) }

      it 'returns an error with 404 status' do
        expect(response_status).to eq 404
        expect(json['error']).to eq 'Record not found'
      end
    end
  end
end
