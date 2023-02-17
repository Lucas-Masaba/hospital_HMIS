require 'rails_helper'

RSpec.describe RadiologyResultsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/radiology_results').to route_to('radiology_results#index')
    end

    it 'routes to #show' do
      expect(get: '/radiology_results/1').to route_to('radiology_results#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/radiology_results').to route_to('radiology_results#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/radiology_results/1').to route_to('radiology_results#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/radiology_results/1').to route_to('radiology_results#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/radiology_results/1').to route_to('radiology_results#destroy', id: '1')
    end
  end
end
