module Files
  class Service
    def self.remove_by_url(url)
      Rails.logger.info 'remove_by_url START'

      public_id_with_type = url[/[a-z0-9]*\.[a-z]{3,}$/]
      public_id = public_id_with_type[0..public_id_with_type.index('.') - 1]
      Rails.logger.info "public_id: #{public_id}"

      res = Cloudinary::Uploader.destroy public_id

      Rails.logger.info "result: #{res}"
      Rails.logger.info 'remove_by_url END'
      res['result'] == 'ok'
    rescue => e
      logger.info "remove_by_url EXCEPTION: #{e.message}"
      false
    end
  end
end