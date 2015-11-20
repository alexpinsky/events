class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, dependent: :destroy

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
