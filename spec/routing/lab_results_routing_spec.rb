require 'rails_helper'

RSpec.describe LabResultsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/lab_results').to route_to('lab_results#index')
    end

    it 'routes to #show' do
      expect(get: '/lab_results/1').to route_to('lab_results#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/lab_results').to route_to('lab_results#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/lab_results/1').to route_to('lab_results#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/lab_results/1').to route_to('lab_results#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/lab_results/1').to route_to('lab_results#destroy', id: '1')
    end
  end
end
