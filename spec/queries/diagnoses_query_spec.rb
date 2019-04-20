require 'rails_helper'

RSpec.describe DiagnosesQuery  do
  describe '#all' do
    subject(:all){ described_class.new.all }

    before { create_list(:diagnosis, 5) }

    it 'returns all diagnoses' do
      expect(all.size).to eq 5
    end
  end
end
