require 'rails_helper'

RSpec.describe Prescription, type: :model do
  let!(:patient) do
    Patient.create!(
      name: 'Kemigisa Diana',
      age: 12, gender: 'F',
      date_of_birth: '2023-01-23',
      address: 'Kampala',
      phone_number: 256_777_777_777,
      next_of_kin: 'Mwine Tom',
      next_of_kin_phone: 256_770_773_778,
      next_of_kin_address: 'Kampala'
    )
  end

  let!(:visit) do
    Visit.create!(
      visit_no: '2',
      visit_owner: 'Caitylyn',
      visit_date: '2023-01-23',
      visit_type: 'review',
      visit_category: 'insurance',
      speciality: 'cardiology',
      member_no: '2A5R2',
      service: 'Consultation',
      patient_id: patient.id
    )
  end

  subject do
    Prescription.new(
      product: 'Paracetamol',
      quantity: 10,
      symbol: '*',
      dose: 2,
      days: 3,
      stock: 10,
      visit_id: visit.id
    )
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
