require 'file_size_validator'

class Picture < ActiveRecord::Base
  belongs_to :displayable, polymorphic: true

  mount_uploader :image, ImageUploader
  validates :image,
    presence: true,
    file_size: {
      maximum: 1.megabytes.to_i
    }

  scope :by_order, -> (order) { where('pictures.order = ?', order).first }
  scope :ordered, -> () { order('pictures.order ASC') }

  def as_json(options = {})
    {
      order: self.order,
      url: self.image_url
    }
  end
end
