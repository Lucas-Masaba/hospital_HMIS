require 'rails_helper'

RSpec.describe Pharmacy, type: :model do
  subject { Pharmacy.new(dispensed: 2) }

  before { subject.save }

  it 'dispensed should be present' do
    subject.dispensed = nil
    expect(subject).to_not be_valid
  end
end
