require 'rails_helper'

RSpec.describe VisitNote, type: :model do
  subject do
    VisitNote.new(complaints: 'Pain in the abdomen', provisional_diagnosis: 'Gastritis')
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
