require 'rails_helper'

RSpec.describe Visit, type: :model do
  describe '#valid?' do
    it 'has a valid factory' do
      expect(build(:visit)).to be_valid
    end

    context 'visit_owner validations' do
      it 'is invalid without a visit_owner' do
        expect(build(:visit, visit_owner: nil | '')).to_not be_valid
      end

      it 'is invalid with a visit_owner that is too short' do
        expect(build(:visit, visit_owner: 'aa')).to_not be_valid
      end

      it 'is invalid with a visit_owner that is too long' do
        expect(build(:visit, visit_owner: 'a' * 21)).to_not be_valid
      end
    end

    context 'visit_type validations' do
      it 'is invalid without a visit_type' do
        expect(build(:visit, visit_type: nil | '')).to_not be_valid
      end

      it 'is invalid with a visit_type that is too short' do
        expect(build(:visit, visit_type: 'aa')).to_not be_valid
      end

      it 'is invalid with a visit_type that is too long' do
        expect(build(:visit, visit_type: 'a' * 11)).to_not be_valid
      end
    end

    context 'visit_date validations' do
      it 'is invalid without a visit_date' do
        expect(build(:visit, visit_date: nil)).to_not be_valid
      end
    end

    context 'visit_category validations' do
      it 'is invalid without a visit_category' do
        expect(build(:visit, visit_category: nil | '')).to_not be_valid
      end

      it 'is invalid with a visit_category that is too short' do
        expect(build(:visit, visit_category: 'aa')).to_not be_valid
      end

      it 'is invalid with a visit_category that is too long' do
        expect(build(:visit, visit_category: 'a' * 11)).to_not be_valid
      end
    end
  end
end
