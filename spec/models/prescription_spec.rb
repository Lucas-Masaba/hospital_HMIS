require 'rails_helper'

RSpec.describe Prescription, type: :model do
  subject do
    Prescription.new(product: 'Paracetamol', quantity: 10, symbol: '*', dose: 2, days: 3, stock: 10)
  end

  before { subject.save }

  context 'product validations' do
    it 'is invalid without a product' do
      subject.product = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid with a product that is too short' do
      subject.product = 'aa'
      expect(subject).to_not be_valid
    end

    it 'is invalid with a product that is too long' do
      subject.product = 'a' * 51
      expect(subject).to_not be_valid
    end
  end

  context 'quantity validations' do
    it 'is invalid without quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
  end

  context 'symbol validations' do
    it 'is invalid without a symbol' do
      subject.symbol = nil
      expect(subject).to_not be_valid
    end
  end

  context 'dose validations' do
    it 'is invalid without a dose' do
      subject.dose = nil
      expect(subject).to_not be_valid
    end
  end

  context 'days validations' do
    it 'is invalid without a days' do
      subject.days = nil
      expect(subject).to_not be_valid
    end
  end

  context 'stock validations' do
    it 'is invalid without a stock' do
      subject.stock = nil
      expect(subject).to_not be_valid
    end
  end
end
