require 'digest/md5'

class Event < ActiveRecord::Base
  belongs_to :user
  has_one :appearance, as: :presentable, dependent: :destroy
  has_many :pictures, as: :displayable, dependent: :destroy
  has_one :song, as: :listenable, dependent: :destroy
  has_one :information, dependent: :destroy

  accepts_nested_attributes_for :pictures, :appearance, :information, :song

  delegate :background_image, :font_family, :font_color, to: :appearance, allow_nil: true
  delegate :start_time, :end_time, :organizer, :organizer_email, :location, :zone_code, :summary, :date_format, to: :information, allow_nil: true
  delegate :audio_url, to: :song, allow_nil: true

  def self.find_by_url(url)
    events = where("events.url = ?", url)
    return events.first if events.size == 1
    events.each do |e|
      url_hash = Digest::MD5.hexdigest "#{url}#{e.created_at.to_f}"
      return e if e.url_hash = url_hash
    end
    nil
  end

  def set_url_hash
    return if self.url.blank? || self.created_at.blank?
    self.url_hash = Digest::MD5.hexdigest "#{self.url}#{self.created_at.to_f}"
    self.save
  end
end
