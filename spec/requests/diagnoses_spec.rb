require 'rails_helper'

RSpec.describe '/diagnoses', type: :request do
  let(:valid_attributes) do
    {
      name: 'Cancer'
    }
  end

  let(:invalid_attributes) do
    {
      name: ''
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # DiagnosesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Diagnosis.create! valid_attributes
      get diagnoses_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      diagnosis = Diagnosis.create! valid_attributes
      get diagnosis_url(diagnosis), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Diagnosis' do
        expect do
          post diagnoses_url,
               params: { diagnosis: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Diagnosis, :count).by(1)
      end

      it 'renders a JSON response with the new diagnosis' do
        post diagnoses_url,
             params: { diagnosis: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Diagnosis' do
        expect do
          post diagnoses_url,
               params: { diagnosis: invalid_attributes }, as: :json
        end.to change(Diagnosis, :count).by(0)
      end

      it 'renders a JSON response with errors for the new diagnosis' do
        post diagnoses_url,
             params: { diagnosis: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Polio'
        }
      end

      it 'updates the requested diagnosis' do
        diagnosis = Diagnosis.create! valid_attributes
        patch diagnosis_url(diagnosis),
              params: { diagnosis: new_attributes }, headers: valid_headers, as: :json
        diagnosis.reload
        expect(diagnosis.name).to eq('Polio')
      end

      it 'renders a JSON response with the diagnosis' do
        diagnosis = Diagnosis.create! valid_attributes
        patch diagnosis_url(diagnosis),
              params: { diagnosis: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the diagnosis' do
        diagnosis = Diagnosis.create! valid_attributes
        patch diagnosis_url(diagnosis),
              params: { diagnosis: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested diagnosis' do
      diagnosis = Diagnosis.create! valid_attributes
      expect do
        delete diagnosis_url(diagnosis), headers: valid_headers, as: :json
      end.to change(Diagnosis, :count).by(-1)
    end
  end
end
