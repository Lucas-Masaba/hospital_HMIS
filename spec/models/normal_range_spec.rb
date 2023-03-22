require 'rails_helper'

RSpec.describe NormalRange, type: :model do
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

  let!(:lab_test) do
    LabTest.create!(
      name: 'Blood Test',
      price: 30_000,
      status: 'Positive',
      referral_status: 'Unknown',
      visit_id: visit.id
    )
  end

  subject do
    NormalRange.new(
      name: 'Heart Beat',
      upper_range: 30_000,
      lower_range: 20_000,
      unit: 'bps',
      lab_test_id: lab_test.id
    )
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'upper_range should be present' do
    subject.upper_range = nil
    expect(subject).to_not be_valid
  end

  it 'lower_range should be present' do
    subject.lower_range = nil
    expect(subject).to_not be_valid
  end

  it 'unit should be present' do
    subject.unit = nil
    expect(subject).to_not be_valid
  end

  it 'subject should be valid' do
    expect(subject).to be_valid
  end
end
