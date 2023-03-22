require 'rails_helper'

RSpec.describe DrugsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/drugs').to route_to('drugs#index')
    end

    it 'routes to #show' do
      expect(get: '/drugs/1').to route_to('drugs#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/drugs').to route_to('drugs#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/drugs/1').to route_to('drugs#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/drugs/1').to route_to('drugs#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/drugs/1').to route_to('drugs#destroy', id: '1')
    end
  end
end
