require "spec_helper"

describe User do

  describe 'self.from_omniauth' do

    context 'when no matching user' do
      let(:uid) { SecureRandom.hex(8).to_s }
      let(:token) { SecureRandom.hex(8).to_s }
      let(:email) { Faker::Internet.email }
      let(:expires_at) { 1.year.from_now.to_i.to_s }
      let(:info) do
        i = double('Info')
        allow(i).to receive(:email) { email }
        i
      end
      let(:credentials) do
        c = double('Credentials')
        allow(c).to receive(:token) { token }
        allow(c).to receive(:expires_at ) { expires_at }
        c
      end
      let(:auth) do
        a = double('Auth')
        allow(a).to receive(:provider) { 'facebook' }
        allow(a).to receive(:uid) { uid }
        allow(a).to receive(:info) { info }
        allow(a).to receive(:credentials) { credentials }
        a
      end

      it 'should create a user with a provider' do
        user = User.from_omniauth auth
        expect(user).to be_persisted
        expect(user.email).to eq email
        provider = user.social_providers.facebook.first
        expect(provider).to be_persisted
        expect(provider.token).to eq token
        expect(provider.expires_at).to eq expires_at
      end
    end
  end
end