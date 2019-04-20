require 'rails_helper'

RSpec.describe DiagnosisSerializer do
  let!(:diagnosis) { create(:diagnosis) }

  it 'return diagnosis data' do
    serializer = described_class.new diagnosis
    hash_result = serializer.serializable_hash
    expect(hash_result[:name]).not_to eq nil
  end
end
