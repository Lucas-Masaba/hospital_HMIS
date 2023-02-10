require 'rails_helper'

RSpec.describe NormalRangesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/normal_ranges').to route_to('normal_ranges#index')
    end

    it 'routes to #show' do
      expect(get: '/normal_ranges/1').to route_to('normal_ranges#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/normal_ranges').to route_to('normal_ranges#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/normal_ranges/1').to route_to('normal_ranges#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/normal_ranges/1').to route_to('normal_ranges#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/normal_ranges/1').to route_to('normal_ranges#destroy', id: '1')
    end
  end
end
