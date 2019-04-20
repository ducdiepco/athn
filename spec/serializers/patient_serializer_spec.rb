require 'rails_helper'

RSpec.describe PatientSerializer do
  let!(:patient) { create(:patient) }

  it 'return patient data' do
    serializer = described_class.new patient
    hash_result = serializer.serializable_hash
    expect(hash_result[:first_name]).not_to eq nil
    expect(hash_result[:last_name]).not_to eq nil
  end
end
