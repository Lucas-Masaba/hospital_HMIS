require 'rails_helper'

RSpec.describe '/normal_ranges', type: :request do
  let(:valid_attributes) do
    {
      name: 'raul',
      upper_range: 3.4,
      lower_range: 5.4,
      unit: 'cm'
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      upper_range: '',
      lower_range: '',
      unit: ''
    }
  end

  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      NormalRange.create! valid_attributes
      get normal_ranges_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      normal_range = NormalRange.create! valid_attributes
      get normal_range_url(normal_range), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new NormalRange' do
        expect do
          post normal_ranges_url,
               params: { normal_range: valid_attributes }, headers: valid_headers, as: :json
        end.to change(NormalRange, :count).by(1)
      end

      it 'renders a JSON response with the new normal_range' do
        post normal_ranges_url,
             params: { normal_range: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new NormalRange' do
        expect do
          post normal_ranges_url,
               params: { normal_range: invalid_attributes }, as: :json
        end.to change(NormalRange, :count).by(0)
      end

      it 'renders a JSON response with errors for the new normal_range' do
        post normal_ranges_url,
             params: { normal_range: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'rasaghoul',
          upper_range: 15,
          lower_range: 45,
          unit: 'cm'
        }
      end

      it 'updates the requested normal_range' do
        normal_range = NormalRange.create! valid_attributes
        patch normal_range_url(normal_range),
              params: { normal_range: new_attributes }, headers: valid_headers, as: :json
        normal_range.reload
        # skip("Add assertions for updated state")
      end

      it 'renders a JSON response with the normal_range' do
        normal_range = NormalRange.create! valid_attributes
        patch normal_range_url(normal_range),
              params: { normal_range: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the normal_range' do
        normal_range = NormalRange.create! valid_attributes
        patch normal_range_url(normal_range),
              params: { normal_range: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested normal_range' do
      normal_range = NormalRange.create! valid_attributes
      expect do
        delete normal_range_url(normal_range), headers: valid_headers, as: :json
      end.to change(NormalRange, :count).by(-1)
    end
  end
end
