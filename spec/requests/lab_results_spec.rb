require 'rails_helper'

RSpec.describe '/lab_results', type: :request do
  let(:valid_attributes) do
    {
      results: 'Positive'
    }
  end

  let(:invalid_attributes) do
    {
      results: ''
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # LabResultsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      LabResult.create! valid_attributes
      get lab_results_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      lab_result = LabResult.create! valid_attributes
      get lab_result_url(lab_result), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new LabResult' do
        expect do
          post lab_results_url,
               params: { lab_result: valid_attributes }, headers: valid_headers, as: :json
        end.to change(LabResult, :count).by(1)
      end

      it 'renders a JSON response with the new lab_result' do
        post lab_results_url,
             params: { lab_result: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new LabResult' do
        expect do
          post lab_results_url,
               params: { lab_result: invalid_attributes }, as: :json
        end.to change(LabResult, :count).by(0)
      end

      it 'renders a JSON response with errors for the new lab_result' do
        post lab_results_url,
             params: { lab_result: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          results: 'Negative'
        }
      end

      it 'updates the requested lab_result' do
        lab_result = LabResult.create! valid_attributes
        patch lab_result_url(lab_result),
              params: { lab_result: new_attributes }, headers: valid_headers, as: :json
        lab_result.reload
        expect(lab_result.results).to eq('Negative')
      end

      it 'renders a JSON response with the lab_result' do
        lab_result = LabResult.create! valid_attributes
        patch lab_result_url(lab_result),
              params: { lab_result: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the lab_result' do
        lab_result = LabResult.create! valid_attributes
        patch lab_result_url(lab_result),
              params: { lab_result: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested lab_result' do
      lab_result = LabResult.create! valid_attributes
      expect do
        delete lab_result_url(lab_result), headers: valid_headers, as: :json
      end.to change(LabResult, :count).by(-1)
    end
  end
end
