require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) do
        {
          user: {
            email: "test@example.com",
            password: "password",
            password_confirmation: "password",
            roles: { role: "admin" }
          }
        }
      end

      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        post :create, params: valid_params
      end

      it "creates a new user" do
        expect(User.count).to eq(1)
      end

      it "returns a success response with token" do
        expect(response).to be_successful
        expect(JSON.parse(response.body)["token"]).not_to be_nil
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        {
          user: {
            email: "",
            password: "password",
            password_confirmation: "password",
            roles: { role: "admin" }
          }
        }
      end

      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        post :create, params: invalid_params
      end

      it "returns an error response" do
        expect(response.status).to eq(422)
        expect(JSON.parse(response.body)["errors"]["email or password"]).to include("is invalid")
      end
    end
  end
end
