class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :theme, class_name: 'Event', foreign_key: 'theme_id'

  has_one :appearance, dependent: :destroy
  has_one :song, as: :listenable, dependent: :destroy
  has_one :information, dependent: :destroy

  has_many :pictures, as: :displayable, dependent: :destroy

  validates :url, uniqueness: true, allow_blank: true

  accepts_nested_attributes_for :pictures,
    :appearance,
    :information,
    :song,
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

  delegate :name, to: :category, prefix: true

  scope :themes,             -> ()              { where('events.is_theme = ?', true) }
  scope :include_categories, -> ()              { includes(:category) }
  scope :with_url,           -> ()              { where('events.url IS NOT NULL') }
  scope :by_category,        -> (category_name) { joins(:category).where('categories.name = ?', category_name) }
  scope :by_url,             -> (url)           { where('events.url = ?', url) }
  scope :by_id,              -> (id)            { where('events.id = ?', id) }

  MAX_PICTURES_SIZE = 4

  def self.copy_from_theme(theme, options = {})
    event          = theme.dup
    event.theme    = theme
    event.name     = nil
    event.is_theme = false
    event.user     = options[:user]
    event.update_appearance theme.appearance
    event.build_missing
    event
  end

  def update_from_theme(theme)
    self.theme = theme
    update_appearance self.theme.appearance
  end

  def update_appearance(appearance)
    attrs = appearance.attributes.except 'id', 'event_id'

    if self.appearance
      self.appearance.assign_attributes attrs
    else
      build_appearance attrs
    end
  end

  def build_missing
    build_information in_use: true unless self.information
    build_pictures
  end

  def theme_name
    self.is_theme ? self.name : self.theme.name
  end

  def build_pictures
    pictures = {}

    self.pictures.each do |pic|
      pictures[pic.order] = true
    end

    MAX_PICTURES_SIZE.times do |i|
      pic_present = pictures[i + 1]

      self.pictures.new order: i + 1, slideshow: true unless pic_present
    end
  end

  def thumbnail_url
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/#{category_name}/themes/#{theme_name}/thumbnail.jpg"
  end

  def published?
    # published
    false
  end

  def full_url
    "#{ENV['ROOT_URL']}#{url}"
  end

  def views_count
    0
  end
end
