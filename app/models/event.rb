class Event < ActiveRecord::Base
  belongs_to :user
  has_one :appearance, as: :presentable, :dependent => :destroy
  has_many :pictures, as: :displayable, :dependent => :destroy
  has_one :song

  accepts_nested_attributes_for :pictures, :appearance
end
