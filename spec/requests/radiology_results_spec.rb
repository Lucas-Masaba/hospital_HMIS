require 'rails_helper'

RSpec.describe '/radiology_results', type: :request do
  let!(:patient) do
    Patient.create!(
      name: 'Kemigisa Diana',
      age: 12, gender: 'F',
      date_of_birth: '2023-01-23',
      address: 'Kampala',
      phone_number: 256_777_777_777,
      next_of_kin: 'Mwine Tom',
      next_of_kin_phone: 256_770_773_778,
      next_of_kin_address: 'Kampala'
    )
  end

  let!(:visit) do
    Visit.create!(
      visit_no: '2',
      visit_owner: 'Caitylyn',
      visit_date: '2023-01-23',
      visit_type: 'review',
      visit_category: 'insurance',
      speciality: 'cardiology',
      member_no: '2A5R2',
      service: 'Consultation',
      patient_id: patient.id
    )
  end

  let(:radiology_exam) do
    RadiologyExam.create!(
      name: 'Brain scan',
      description: 'Scanned and took apart the sculp',
      visit_id: visit.id
    )
  end

  let(:valid_attributes) do
    {
      image: 'Brain Scan',
      notes: 'Long notes',
      radiology_exam_id: radiology_exam.id
    }
  end

  let(:invalid_attributes) do
    {
      image: '',
      notes: '',
      radiology_exam_id: nil
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
          notes: 'Long Notes on Scan',
          radiology_exam_id: radiology_exam.id
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
