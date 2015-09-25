class Lead < ActiveRecord::Base
  validate :_valid_email

  private

  def _valid_email
    errors.add(:email, 'must be present') if self.email.blank?
    errors.add(:email, 'must be valid address') unless Devise::email_regexp =~ self.email
  end
end