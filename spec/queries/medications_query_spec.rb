require 'rails_helper'

RSpec.describe MedicationsQuery  do
  describe '#all' do
    subject(:all){ described_class.new.all }

    before { create_list(:medication, 5) }

    it 'returns all medications' do
      expect(all.size).to eq 5
    end
  end
end
