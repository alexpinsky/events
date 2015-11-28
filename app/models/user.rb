class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :events, dependent: :destroy
  has_many :social_providers, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email    = auth.info.email
      user.password = Devise.friendly_token[0,20]

      user.social_providers.facebook.first_or_create do |provider|
        provider.token = auth.credentials.token
        provider.expires_at = auth.credentials.expires_at
      end
    end
  end

  def admin?
    ADMINS[email]
  end

  private

  ADMINS = {
    'alex_pinsky85@yahoo.com' => true,
    'gilmagen15@gmail.com'    => true,
    'hilashamir4@gmail.com'   => true
  }
end
