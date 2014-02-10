CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIQI3X75JJC22IZVQ',
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'events-assets-users'
end

module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end