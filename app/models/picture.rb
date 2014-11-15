require 'file_size_validator' 

class Picture < ActiveRecord::Base
  belongs_to :displayable, polymorphic: true
  
  mount_uploader :image, ImageUploader
  validates :image, 
    presence: true, 
    file_size: { 
      maximum: 1.megabytes.to_i 
    }

  scope :slideshow, -> () { where('pictures.slideshow = ?', true) }
  scope :by_order, -> (order) { where('pictures.order = ?', order).first }
end
