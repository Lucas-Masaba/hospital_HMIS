require 'rails_helper'

RSpec.describe '/radiology_results', type: :request do
  let(:valid_attributes) do
    {
      image: 'Brain Scan',
      notes: 'Long notes'
    }
  end

  let(:invalid_attributes) do
    {
      image: '',
      notes: ''
    }
  end

  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      RadiologyResult.create! valid_attributes
      get radiology_results_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      radiology_result = RadiologyResult.create! valid_attributes
      get radiology_result_url(radiology_result), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new RadiologyResult' do
        expect do
          post radiology_results_url,
               params: { radiology_result: valid_attributes }, headers: valid_headers, as: :json
        end.to change(RadiologyResult, :count).by(1)
      end

      it 'renders a JSON response with the new radiology_result' do
        post radiology_results_url,
             params: { radiology_result: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new RadiologyResult' do
        expect do
          post radiology_results_url,
               params: { radiology_result: invalid_attributes }, as: :json
        end.to change(RadiologyResult, :count).by(0)
      end

      it 'renders a JSON response with errors for the new radiology_result' do
        post radiology_results_url,
             params: { radiology_result: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          image: 'Lung Scan',
          notes: 'Long Notes on Scan'
        }
      end

      it 'updates the requested radiology_result' do
        radiology_result = RadiologyResult.create! valid_attributes
        patch radiology_result_url(radiology_result),
              params: { radiology_result: new_attributes }, headers: valid_headers, as: :json
        radiology_result.reload
        expect(radiology_result.image).to eq('Lung Scan')
      end

      it 'renders a JSON response with the radiology_result' do
        radiology_result = RadiologyResult.create! valid_attributes
        patch radiology_result_url(radiology_result),
              params: { radiology_result: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the radiology_result' do
        radiology_result = RadiologyResult.create! valid_attributes
        patch radiology_result_url(radiology_result),
              params: { radiology_result: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested radiology_result' do
      radiology_result = RadiologyResult.create! valid_attributes
      expect do
        delete radiology_result_url(radiology_result), headers: valid_headers, as: :json
      end.to change(RadiologyResult, :count).by(-1)
    end
  end
end
