require 'file_size_validator' 

class Picture < ActiveRecord::Base
  belongs_to :displayable, polymorphic: true
  
  mount_uploader :image, ImageUploader
  validates :image, 
    :presence => true, 
    :file_size => { 
      :maximum => 1.megabytes.to_i 
    } 
end
