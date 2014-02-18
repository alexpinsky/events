class Appearance < ActiveRecord::Base
  belongs_to :presentable, polymorphic: true
end
