require 'rails_helper'

RSpec.describe RadiologyExamsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/radiology_exams').to route_to('radiology_exams#index')
    end

    it 'routes to #show' do
      expect(get: '/radiology_exams/1').to route_to('radiology_exams#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/radiology_exams').to route_to('radiology_exams#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/radiology_exams/1').to route_to('radiology_exams#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/radiology_exams/1').to route_to('radiology_exams#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/radiology_exams/1').to route_to('radiology_exams#destroy', id: '1')
    end
  end
end
