require 'rails_helper'

RSpec.describe '/attachments', type: :request do
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

  let(:valid_attributes) do
    {
      name: 'Xray',
      description: 'Broken Femur',
      admissions: 'None',
      visit_id: visit.id
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      description: '',
      admissions: ''
    }
  end

  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Attachment.create! valid_attributes
      get attachments_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      attachment = Attachment.create! valid_attributes
      get attachment_url(attachment), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Attachment' do
        expect do
          post attachments_url,
               params: { attachment: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Attachment, :count).by(1)
      end

      it 'renders a JSON response with the new attachment' do
        post attachments_url,
             params: { attachment: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Attachment' do
        expect do
          post attachments_url,
               params: { attachment: invalid_attributes }, as: :json
        end.to change(Attachment, :count).by(0)
      end

      it 'renders a JSON response with errors for the new attachment' do
        post attachments_url,
             params: { attachment: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'CT Scan',
          description: 'Tumor',
          admissions: 'None',
          visit_id: visit.id
        }
      end

      it 'updates the requested attachment' do
        attachment = Attachment.create! valid_attributes
        patch attachment_url(attachment),
              params: { attachment: new_attributes }, headers: valid_headers, as: :json
        attachment.reload
        expect(attachment.name).to eq('CT Scan')
      end

      it 'renders a JSON response with the attachment' do
        attachment = Attachment.create! valid_attributes
        patch attachment_url(attachment),
              params: { attachment: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the attachment' do
        attachment = Attachment.create! valid_attributes
        patch attachment_url(attachment),
              params: { attachment: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested attachment' do
      attachment = Attachment.create! valid_attributes
      expect do
        delete attachment_url(attachment), headers: valid_headers, as: :json
      end.to change(Attachment, :count).by(-1)
    end
  end
end
