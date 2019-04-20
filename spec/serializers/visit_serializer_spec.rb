require 'rails_helper'

RSpec.describe VisitSerializer do
  let!(:visit) { create(:visit) }

  it 'return visit data' do
    serializer = described_class.new visit
    hash_result = serializer.serializable_hash
    expect(hash_result[:visit_date]).not_to eq nil
    expect(hash_result[:notes]).not_to eq nil
    expect(hash_result[:provider][:first_name]).not_to eq nil
    expect(hash_result[:provider][:last_name]).not_to eq nil
    expect(hash_result[:provider][:office_address]).not_to eq nil
    expect(hash_result[:provider][:office_city]).not_to eq nil
    expect(hash_result[:provider][:office_state]).not_to eq nil
  end
end
