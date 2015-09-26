class Lead < ActiveRecord::Base
  has_many :contact_requests

  validates_presence_of :email
  validates_format_of   :email, with: Devise::email_regexp
end