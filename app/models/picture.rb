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
    logger.info 'remove_image_from_source! START'
    url = changes[:image_url].first
    public_id_with_type = url[/[a-z0-9]*\.[a-z]{3,}$/]
    public_id = public_id_with_type[0..public_id_with_type.index('.') - 1]
    logger.info "public_id: #{public_id}"
    res = Cloudinary::Uploader.destroy public_id, invalidate: true
    logger.info "result: #{res}"
    logger.info 'remove_image_from_source! END'
    return false unless res['result'] == 'ok'
  end
end
