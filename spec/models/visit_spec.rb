require 'rails_helper'

RSpec.describe Visit, type: :model do
  subject do
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
  
    subject do
      Visit.new(
        visit_no: '2',
        visit_owner: 'Caitylyn',
        visit_date: '2023-01-23',
        visit_type: 'review',
        visit_category: 'insurance',
        speciality: 'cardiology',
        member_no: '2A5R2',
        service: 'Treatment',
        patient_id: patient.id
      )
    end

  before { subject.save }

  describe '#valid?' do
    context 'visit_owner validations' do
      it 'is invalid without a visit_owner' do
        subject.visit_owner = nil
        expect(subject).to_not be_valid
      end

      it 'is invalid with a visit_owner that is too short' do
        subject.visit_owner = 'aa'
        expect(subject).to_not be_valid
      end

      it 'is invalid with a visit_owner that is too long' do
        subject.visit_owner = 'a' * 21
        expect(subject).to_not be_valid
      end
    end

    context 'visit_type validations' do
      it 'is invalid without a visit_type' do
        subject.visit_type = nil
        expect(subject).to_not be_valid
      end

      it 'is invalid with a visit_type that is too short' do
        subject.visit_type = 'aa'
        expect(subject).to_not be_valid
      end

      it 'is invalid with a visit_type that is too long' do
        subject.visit_type = 'a' * 11
        expect(subject).to_not be_valid
      end
    end

    context 'visit_date validations' do
      it 'is invalid without a visit_date' do
        subject.visit_date = nil
        expect(subject).to_not be_valid
      end
    end

    context 'visit_category validations' do
      it 'is invalid without a visit_category' do
        subject.visit_category = nil
        expect(subject).to_not be_valid
      end

      it 'is invalid with a visit_category that is too short' do
        subject.visit_category = 'aa'
        expect(subject).to_not be_valid
      end

      it 'is invalid with a visit_category that is too long' do
        subject.visit_category = 'a' * 11
        expect(subject).to_not be_valid
      end
    end
  end
end
