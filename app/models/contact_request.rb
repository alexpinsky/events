class ContactRequest < ActiveRecord::Base
  validates_presence_of :email
  validates_format_of :email, with: Devise::email_regexp
end