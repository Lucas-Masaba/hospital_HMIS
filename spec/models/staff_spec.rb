require 'spec_helper'
require 'rails_helper'

RSpec.describe "Staff", type: :model do
  subject { Staff.new(email: 'Tom', password: 'password') }

  before { subject.save }

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
