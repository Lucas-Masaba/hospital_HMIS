require 'rails_helper'

RSpec.describe '/radiology_exams', type: :request do
  let(:valid_attributes) do
    {
      name: 'Brain scan',
      description: 'Scanned and took apart the sculp'
    }
  end

  let(:invalid_attributes) do
    {
      name: 4,
      description: nil
    }
  end

  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      RadiologyExam.create! valid_attributes
      get radiology_exams_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      radiology_exam = RadiologyExam.create! valid_attributes
      get radiology_exam_url(radiology_exam), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new RadiologyExam' do
        expect do
          post radiology_exams_url,
               params: { radiology_exam: valid_attributes }, headers: valid_headers, as: :json
        end.to change(RadiologyExam, :count).by(1)
      end

      it 'renders a JSON response with the new radiology_exam' do
        post radiology_exams_url,
             params: { radiology_exam: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new RadiologyExam' do
        expect do
          post radiology_exams_url,
               params: { radiology_exam: invalid_attributes }, as: :json
        end.to change(RadiologyExam, :count).by(0)
      end

      it 'renders a JSON response with errors for the new radiology_exam' do
        post radiology_exams_url,
             params: { radiology_exam: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Back scan',
          description: 'Scanned and took apart the spine'
        }
      end

      it 'updates the requested radiology_exam' do
        radiology_exam = RadiologyExam.create! valid_attributes
        patch radiology_exam_url(radiology_exam),
              params: { radiology_exam: new_attributes }, headers: valid_headers, as: :json
        radiology_exam.reload
        expect(radiology_exam.name).to eq('Back scan')
      end

      it 'renders a JSON response with the radiology_exam' do
        radiology_exam = RadiologyExam.create! valid_attributes
        patch radiology_exam_url(radiology_exam),
              params: { radiology_exam: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the radiology_exam' do
        radiology_exam = RadiologyExam.create! valid_attributes
        patch radiology_exam_url(radiology_exam),
              params: { radiology_exam: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested radiology_exam' do
      radiology_exam = RadiologyExam.create! valid_attributes
      expect do
        delete radiology_exam_url(radiology_exam), headers: valid_headers, as: :json
      end.to change(RadiologyExam, :count).by(-1)
    end
  end
end
