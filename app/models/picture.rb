class Picture < ActiveRecord::Base
  belongs_to :event

  scope :by_order, -> (order) { where('pictures.order = ?', order).first }
  scope :ordered, -> () { order('pictures.order ASC') }

  before_destroy :remove_image_from_source!

  def as_json(options = {})
    {
      id: self.id,
      order: self.order,
      url: self.image_url
    }
  end

  def remove_image_from_source!
    return true if changes[:image_url].blank?
    Files::Service.remove_by_url changes[:image_url].first
    true
  end
end
