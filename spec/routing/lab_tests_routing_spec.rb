require 'rails_helper'

RSpec.describe LabTestsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/lab_tests').to route_to('lab_tests#index')
    end

    it 'routes to #show' do
      expect(get: '/lab_tests/1').to route_to('lab_tests#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/lab_tests').to route_to('lab_tests#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/lab_tests/1').to route_to('lab_tests#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/lab_tests/1').to route_to('lab_tests#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/lab_tests/1').to route_to('lab_tests#destroy', id: '1')
    end
  end
end
