require 'file_size_validator' 

class Song < ActiveRecord::Base
  belongs_to :listenable, polymorphic: true
  
  mount_uploader :audio, AudioUploader
  validates :audio, 
    :presence => true, 
    :file_size => { 
      :maximum => 1.5.megabytes.to_i 
    } 
end
