class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :events, dependent: :destroy

  scope :by_email, -> (email) { where('users.email = ?', email) }

  def self.from_omniauth(auth)
    by_email(auth.info.email).first_or_create do |user|
      user.email    = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def admin?
    ADMINS[email]
  end

  private

  ADMINS = {
    'alex.pinsky85@gmail.com' => true,
    'gilmagen15@gmail.com'    => true,
    'hilashamir4@gmail.com'   => true
  }
end
