require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:valid_params) { { user: { email: user.email, password: user.password } } }
    let(:invalid_params) { { user: { email: user.email, password: 'wrong_password' } } }

    before { @request.env["devise.mapping"] = Devise.mappings[:user] }
    context 'when using valid credentials' do
      before { post :create, params: valid_params }

      it 'returns a JSON response with a JWT token' do
        expect(response).to have_http_status(:success)
        expect(response.content_type).to include('application/json')
        expect(response.body).to include('token')
      end
    end

    context 'when using invalid credentials' do
      before { post :create, params: invalid_params }

      it 'returns an error JSON response' do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
        expect(response.body).to include('email or password')
      end
    end
  end
end
