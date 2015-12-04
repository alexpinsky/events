require "spec_helper"

describe User do

  describe 'self.from_omniauth' do
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

    context 'when no matching user' do

      it 'should create a user' do
        user = User.from_omniauth auth
        expect(user).to be_persisted
        expect(user.email).to eq email
      end
    end

    context 'when there is a matching user' do
      let!(:user) { User.create(email: email, password: Devise.friendly_token[0, 20]) }

      it 'should return the user' do
        expect(User.from_omniauth(auth)).to eq user
      end
    end
  end
end