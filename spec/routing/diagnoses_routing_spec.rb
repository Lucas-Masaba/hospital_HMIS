require 'rails_helper'

RSpec.describe DiagnosesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/diagnoses').to route_to('diagnoses#index')
    end

    it 'routes to #show' do
      expect(get: '/diagnoses/1').to route_to('diagnoses#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/diagnoses').to route_to('diagnoses#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/diagnoses/1').to route_to('diagnoses#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/diagnoses/1').to route_to('diagnoses#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/diagnoses/1').to route_to('diagnoses#destroy', id: '1')
    end
  end
end
