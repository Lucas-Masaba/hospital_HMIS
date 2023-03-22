require 'rails_helper'

RSpec.describe VisitNote, type: :model do
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

  let!(:triage) do
    Triage.create!(
      name: 'Test Triage',
      value_one: '35',
      value_two: '24',
      date_time: DateTime.now,
      visit_id: visit.id
    )
  end

  subject do
    VisitNote.new(
      complaints: 'Pain in the abdomen',
      provisional_diagnosis: 'Gastritis',
      visit_id: visit.id,
      triage_id: triage.id
    )
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid without complaints' do
    subject.complaints = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid without a provisional_diagnosis' do
    subject.provisional_diagnosis = nil
    expect(subject).to_not be_valid
  end
end
