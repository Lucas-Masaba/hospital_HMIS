require 'rails_helper'

RSpec.describe Prescription, type: :model do
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

      # it 'is invalid with a product that is too long' do
      #   expect(build(:prescription, product: 'a' * 50)).to_not be_valid
      # end
    end

    # context 'quantity validations' do
    #   it 'is invalid without quantity' do
    #     expect(build(:prescription, quantity: nil | '')).to_not be_valid
    #   end
    # end

    # context 'dose validations' do
    #   it 'is invalid without a dose' do
    #     expect(build(:prescription, dose: nil | '')).to_not be_valid
    #   end
    # end

    # context 'symbol validations' do
    #   it 'is invalid without a symbol' do
    #     expect(build(:prescription, symbol: nil | '')).to_not be_valid
    #   end
    # end

    # context 'days validations' do
    #   it 'is invalid without days' do
    #     expect(build(:prescription, days: nil | '')).to_not be_valid
    #   end
    # end

    # context 'stock validations' do
    #   it 'is invalid without stock' do
    #     expect(build(:prescription, stock: nil | '')).to_not be_valid
    #   end
    # end

    # context 'visit_id validations' do
    #   it 'is invalid without a visit_id' do
    #     expect(build(:prescription, visit_id: nil | '')).to_not be_valid
    #   end
    # end
  end
end
