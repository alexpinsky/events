class Picture < ActiveRecord::Base
  belongs_to :event

  scope :by_order, -> (order) { where('pictures.order = ?', order).first }
  scope :ordered, -> () { order('pictures.order ASC') }

  def as_json(options = {})
    {
      id: self.id,
      order: self.order,
      url: self.image_url
    }
  end
end
