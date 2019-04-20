require 'rails_helper'

RSpec.describe PatientDiagnosisSerializer do
  let!(:patient_diagnosis) { create(:patient_diagnosis) }

  it 'return patient diagnosis data' do
    serializer = described_class.new patient_diagnosis
    hash_result = serializer.serializable_hash
    expect(hash_result[:start_date]).not_to eq nil
    expect(hash_result[:end_date]).not_to eq nil
    expect(hash_result[:diagnosis][:name]).not_to eq nil
    expect(hash_result[:diagnosing_provider][:first_name]).not_to eq nil
    expect(hash_result[:diagnosing_provider][:last_name]).not_to eq nil
    expect(hash_result[:diagnosing_provider][:office_address]).not_to eq nil
    expect(hash_result[:diagnosing_provider][:office_city]).not_to eq nil
    expect(hash_result[:diagnosing_provider][:office_state]).not_to eq nil
  end
end
