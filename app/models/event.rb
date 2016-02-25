class Event < ActiveRecord::Base
  belongs_to :user

  has_one :appearance, dependent: :destroy
  has_one :information, dependent: :destroy

  has_many :pictures, dependent: :destroy
  has_many :views, dependent: :destroy

  validates :template_id, presence: true
  validates :url, uniqueness: true, allow_blank: true

  accepts_nested_attributes_for :pictures,
    :appearance,
    :information,
  allow_destroy: true

  delegate :background_image,
    :font_family_1,
    :font_color_1,
    :font_size_1,
    :font_family_2,
    :font_color_2,
    :font_size_2,
    :font_family_3,
    :font_color_3,
    :font_size_3,
  to: :appearance, allow_nil: true

  delegate :start_time,
    :end_time,
    :organizer,
    :organizer_email,
    :location,
    :time_zone,
    :summary,
    :date_format,
  to: :information, allow_nil: true

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

  def as_json(options = {})
    base = {
      id: self.id,
      name: self.name,
      url: self.url,
      texts: {},
      pictures: Hash[self.pictures.map { |pic| [pic.order, pic.as_json] }],
    }

    base.merge!(
      texts: {
        1 => self.text_1,
        2 => self.text_2,
        3 => self.text_3
      }
    ) unless options[:new_event]

    base
  end
end
