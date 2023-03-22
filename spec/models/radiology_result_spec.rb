require 'rails_helper'

RSpec.describe RadiologyResult, type: :model do
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

  let(:radiology_exam) do
    RadiologyExam.create!(
      name: 'Brain scan',
      description: 'Scanned and took apart the sculp',
      visit_id: visit.id
    )
  end

  subject do
    RadiologyResult.new(
      image: 'Heart Scan',
      notes: 'This is a long description',
      radiology_exam_id: radiology_exam.id
    )
  end

  before { subject.save }

  it 'image should be present' do
    subject.image = nil
    expect(subject).to_not be_valid
  end

  it 'notes should be present' do
    subject.notes = nil
    expect(subject).to_not be_valid
  end
end
