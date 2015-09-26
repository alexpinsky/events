class ContactRequest < ActiveRecord::Base
  belongs_to :lead

  validates_presence_of :email
  validates_format_of   :email, with: Devise::email_regexp

  before_save :_attach_to_lead

  private

  def _attach_to_lead
    lead         = Lead.find_or_create_by email: email
    self.lead_id = lead.id
  end
end