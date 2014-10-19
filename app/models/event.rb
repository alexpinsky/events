require 'digest/md5'

class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :theme, class_name: 'Event', foreign_key: 'theme_id'
  has_one :appearance, as: :presentable, dependent: :destroy
  has_many :pictures, as: :displayable, dependent: :destroy
  has_one :song, as: :listenable, dependent: :destroy
  has_one :information, dependent: :destroy

  accepts_nested_attributes_for :pictures, :appearance, :information, :song

  delegate :background_image, :font_family, :font_color, to: :appearance, allow_nil: true
  delegate :start_time, :end_time, :organizer, :organizer_email, :location, :time_zone, :summary, :date_format, to: :information, allow_nil: true
  delegate :audio_url, to: :song, allow_nil: true

  MAX_PICTURES_SIZE = 5

  def self.find_by_url(url)
    events = where("events.url = ?", url)
    return events.first if events.size == 1
    events.each do |e|
      url_hash = Digest::MD5.hexdigest "#{url}#{e.created_at.to_f}"
      return e if e.url_hash = url_hash
    end
    nil
  end

  def self.create_from_theme(category, theme, user)
    theme = if theme.nil?
      is_user_choose = false
      category.events.first
    else
      is_user_choose = true
      theme
    end
  end

  def set_url_hash
    return if self.url.blank? || self.created_at.blank?
    self.url_hash = Digest::MD5.hexdigest "#{self.url}#{self.created_at.to_f}"
    self.save
  end

  def add_pictures(pictures_attributes, is_first_image)
    result = {}
    self.pictures.destroy_all if is_first_image
    if self.pictures.size == MAX_PICTURES_SIZE
      result[:error] = "event can contain only #{MAX_PICTURES_SIZE} pictures"
    else
      picture = self.pictures.new(pictures_attributes)
      if picture.save
        result[:success] = "#{picture.image.file.filename} saved successfully"
      else
        result[:error] = picture.errors.full_messages
      end
    end
    result
  end

  def add_song(song_params)
    result = {}
    self.song = nil
    self.song = Song.new(song_params)
    if self.song.save
      result[:success] = "#{self.song.audio.file.filename} saved successfully"
    else
      result[:error] = self.song.errors.full_messages
    end
    result
  end
end
