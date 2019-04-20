require 'rails_helper'

RSpec.describe PatientsQuery  do
  describe '#all' do
    subject(:all){ described_class.new.all }

    before { create_list(:patient, 5) }

    it 'returns all patients' do
      expect(all.size).to eq 5
    end
  end
end
