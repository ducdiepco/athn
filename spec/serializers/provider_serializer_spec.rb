require 'rails_helper'

RSpec.describe ProviderSerializer do
  let!(:provider) { create(:provider) }

  it 'return provider data' do
    serializer = described_class.new provider
    hash_result = serializer.serializable_hash
    expect(hash_result[:first_name]).not_to eq nil
    expect(hash_result[:last_name]).not_to eq nil
    expect(hash_result[:office_address]).not_to eq nil
    expect(hash_result[:office_city]).not_to eq nil
    expect(hash_result[:office_state]).not_to eq nil
  end
end
