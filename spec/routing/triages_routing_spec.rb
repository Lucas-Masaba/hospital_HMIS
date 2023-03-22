require 'rails_helper'

RSpec.describe TriagesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/triages').to route_to('triages#index')
    end

    it 'routes to #show' do
      expect(get: '/triages/1').to route_to('triages#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/triages').to route_to('triages#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/triages/1').to route_to('triages#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/triages/1').to route_to('triages#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/triages/1').to route_to('triages#destroy', id: '1')
    end
  end
end
