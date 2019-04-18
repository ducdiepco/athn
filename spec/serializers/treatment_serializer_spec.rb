require 'rails_helper'

RSpec.describe TreatmentSerializer do
  let!(:treatment) { create(:treatment) }

  it 'return treatment with all associates' do
    serializer = described_class.new treatment
    hash_result = serializer.serializable_hash
    expect(hash_result[:dosage]).to eq '100mL / hour'
    expect(hash_result[:start_date]).not_to eq nil
    expect(hash_result[:end_date]).not_to eq nil
    expect(hash_result[:medication][:id]).not_to eq nil
    expect(hash_result[:medication][:medication_name]).not_to eq nil
  end
end
