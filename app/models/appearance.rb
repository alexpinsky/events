class Appearance < ActiveRecord::Base
  belongs_to :presentable, polymorphic: true

  def self.new_example
     Appearance.new font_family: 'handwrite', font_color: '#fff', background_image: 'dark_wall'
  end
end
