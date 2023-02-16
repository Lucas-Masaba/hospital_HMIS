require 'rails_helper'

RSpec.describe '/attachments', type: :request do
  let(:valid_attributes) do
    {
      name: 'Xray',
      description: 'Broken Femur',
      admissions: 'None'
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
          admissions: 'None'
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
