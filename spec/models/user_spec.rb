require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#generate_jwt' do
    let(:user) { create(:user) }

    it 'returns a JWT token with the user id' do
      token = user.generate_jwt
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)

      expect(decoded_token[0]['id']).to eq(user.id)
    end

    it 'sets the token expiration date to 60 days from now' do
      token = user.generate_jwt
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)

      expect(decoded_token[0]['exp']).to eq(60.days.from_now.to_i)
    end
  end
end
