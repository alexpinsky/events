class FromCarrierwaveToCloudinary
  FILE_PATH = "https://events-assets-users.s3.amazonaws.com/uploads/%{env}/picture/image/%{picture_id}/%{image_name}"

  def self.run
    env = Rails.env
    Picture.all.each do |pic|
      begin
        s3_image_path = FILE_PATH % { env: env, picture_id: pic.id, image_name: pic.image_url }
        res = Cloudinary::Uploader.upload s3_image_path
        cloudinary_image_path = res.with_indifferent_access[:url]
        pic.update_column :image_url, cloudinary_image_path
      rescue => e
        puts ">>>>>> Exception: #{e.message}"
        puts ">>>>>> Picture.id: #{pic.id}"
      end
    end

    true
  end
end
