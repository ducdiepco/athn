require 'rails_helper'

RSpec.describe MedicationSerializer do
  let!(:medication) { create(:medication) }

  it 'return medication data' do
    serializer = described_class.new medication
    hash_result = serializer.serializable_hash
    expect(hash_result[:medication_name]).not_to eq nil
    expect(hash_result[:id]).not_to eq nil
  end
end
