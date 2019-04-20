require 'rails_helper'

RSpec.describe Patient, type: :model do

  context 'validation tests' do
    subject {  described_class.new(attributes_for(:patient)) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
