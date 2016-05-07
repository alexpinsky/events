class AddPicturesToEvents < ActiveRecord::Migration
  def up
    add_column :events, :pictures, :jsonb, null: false, default: '{}'
    add_index  :events, :pictures, using: :gin

    Event.reset_column_information

    Event.all.each do |event|
      pictures = Picture.where(event_id: event.id)
      next if pictures.blank?

      pictures_hash = Hash[pictures.map { |pic| [pic.order, { url: pic.image_url }] }]
      event.pictures = pictures_hash
      event.save
    end
  end

  def down
    remove_column :events, :pictures
  end
end
