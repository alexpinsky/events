class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :template

  has_many :pictures, dependent: :destroy
  has_many :views,    dependent: :destroy

  validates :template_id, presence: true
  validates :url, uniqueness: true, allow_blank: true

  accepts_nested_attributes_for :pictures, allow_destroy: true

  scope :with_user, -> () { where('events.user_id IS NOT NULL') }
  scope :with_url, -> () { where('events.url IS NOT NULL') }
  scope :by_url, -> (url) { where('events.url = ?', url) }
  scope :by_id, -> (id) { where('events.id = ?', id) }
  scope :published, -> { where('events.state = ?', STATES[:published]) }

  STATES = { unpublished: 0, published: 1, disabled: 2, pending: 3 }

  def viewable_for?(user)
    return true  if theme? # if theme visible for everyone
    return true  if published? # if published visible for everyone
    return false if user.nil?  # not published and no user
    return user_id == user.id || user.admin?
  end

  def published?
    state == STATES[:published]
  end

  def pending?
    state == STATES[:pending]
  end

  def disabled?
    state == STATES[:disabled]
  end

  def full_url
    url = self.url.blank? ? "events/#{id}" : self.url
    "#{ENV['ROOT_URL']}#{url}"
  end
end
