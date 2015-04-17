class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :theme, class_name: 'Event', foreign_key: 'theme_id'
  
  has_one :appearance, dependent: :destroy
  has_one :song, as: :listenable, dependent: :destroy
  has_one :information, dependent: :destroy
  
  has_many :pictures, as: :displayable, dependent: :destroy

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
  delegate :name, to: :theme, prefix: true
  
  scope :themes, -> () { where('events.is_theme = ?', true) }
  scope :include_categories, -> () { includes(:category) }
  scope :with_url, -> () { where('events.url IS NOT NULL') }
  scope :by_category, -> (category_name) { joins(:category).where('categories.name = ?', category_name) }
  scope :by_url, -> (url) { where('events.url = ?', url) }
  scope :by_id, -> (id) { where('events.id = ?', id) }

  MAX_PICTURES_SIZE = 5

  # args: {:user, :theme}
  def self.copy_from_theme(args)
    event = args[:theme].deep_clone include: :appearance, except: [:is_theme, :name]
    event.user = args[:user]
    event.theme = args[:theme]
    event.is_theme = false
    args[:theme].pictures.each do |pic|
      event.pictures.new(order: pic.order, slideshow: pic.slideshow)
    end
    event.information = Information.new(in_use: true)
    event
  end

  # args: {:event, :theme}
  def self.update_from_theme(args)
    event = args[:event]
    theme = args[:theme]
    if theme
      # for change in theme
      event_appearance = event.appearance
      old_appearance = event_appearance.deep_clone
      old_appearance.id = event_appearance.id
      event.theme_id = theme.id
      event_appearance.assign_attributes(theme.appearance.attributes)
      event_appearance.id = old_appearance.id
    end
    theme ||= event.theme
    event.information ||= Information.new(in_use: true)
    existing_pic_orders = event.pictures.map(&:order) + [0] # => escape null
    missing_pics = theme.pictures.where('pictures.order NOT IN (?)', existing_pic_orders)
    missing_pics.each do |pic| 
      event.pictures.new(
        order: pic.order, 
        slideshow: pic.slideshow
      )
    end
  end

  def theme_name
    self.is_theme ? self.name : self.theme.name
  end

  def thumbnail_url
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/#{category_name}/themes/#{theme_name}/thumbnail.jpg"
  end

  def published?
    false
  end

  def views_count
    0
  end
end
