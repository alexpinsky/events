class DropAppearancesAndAddToEvents < ActiveRecord::Migration
  def up
    add_column :events, :appearance, :jsonb, null: false, default: '{}'
    add_index  :events, :appearance, using: :gin

    Event.reset_column_information

    Appearance.all.each do |appearance|
      event = Event.where(id: appearance.event_id).first
      next unless event

      texts = {
        1 => {
          text: event.text_1,
          font: appearance.font_family_1,
          color: appearance.font_color_1,
          size: appearance.font_size_1
        },
        2 => {
          text: event.text_2,
          font: appearance.font_family_2,
          color: appearance.font_color_2,
          size: appearance.font_size_2
        },
        3 => {
          text: event.text_3,
          font: appearance.font_family_3,
          color: appearance.font_color_3,
          size: appearance.font_size_3
        }
      }

      if appearance.background_image

        appearance_hash = {
          background: {
            type: 'image',
            url: appearance.background_image
          }
        }
      else

        appearance_hash = {
          background: {
            type: 'color',
            color: 'white'
          }
        }
      end

      event.texts      = texts
      event.appearance = appearance_hash
      event.save
    end

    drop_table :appearances
  end

  def down
    remove_column :events, :appearance
  end
end
