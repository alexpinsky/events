class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, :dependent => :destroy

  def admin?
    ['alex_pinsky85@yahoo.com', 'gilmagen15@gmail.com', 'ron.gilat@gmail.com'].include?(self.email) 
  end
end
