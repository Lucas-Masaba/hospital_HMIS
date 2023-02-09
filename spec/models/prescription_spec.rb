require 'rails_helper'

RSpec.describe Prescription, type: :model do
  before(:example) do
    @visit = build(:visit)
    @visit.save
    @prescription = build(:prescription , visit_id: @visit.id)
    @prescription.save
  end

  describe '#valid?' do
    it 'has a valid factory' do
      expect(build(:prescription)).to be_valid
    end

    context 'product validations' do
      it 'is invalid without a product' do
        expect(build(:prescription, product: nil | '')).to_not be_valid
      end

      it 'is invalid with a product that is too short' do
        expect(build(:prescription, product: 'a' * 2)).to_not be_valid
      end

      it 'is invalid with a product that is too long' do
        expect(build(:prescription, product: 'a' * 51)).to_not be_valid
      end
    end
    
    context 'visit_id validations' do
      it 'is invalid without a visit_id' do
        expect(build(:prescription, visit_id: nil | '')).to_not be_valid
      end
    end
  end
end
