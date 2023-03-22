require 'rails_helper'

RSpec.describe Diagnosis, type: :model do
  subject { Diagnosis.new(name: 'Cancer') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
