class RemoveThemeFromEvent < ActiveRecord::Migration
  def up
    themes_to_templates_map = {}
    Event
      .where('events.is_theme = ?', true)
      .where('events.state != ?', Event::STATES[:disabled]).each do |theme|
        category = Category.find theme.category_id
        template = Template.create!(
          category_id: category.id,
          name: theme.name,
          thumbnail_url: "https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/#{category.name}/themes/#{theme.name}/thumbnail.jpg"
        )
        themes_to_templates_map[theme.id] = template.id
        theme.destroy!
      end

    Event.all.each do |event|
      event.template_id = themes_to_templates_map[event.theme_id]
      if event.template_id.blank?
        event.destroy!
      else
        event.save!
      end
    end

    remove_column :events, :is_theme
    remove_column :events, :theme_id
    remove_column :events, :category_id
  end

  def down
    add_column :events, :is_theme, :boolean
    add_column :events, :theme_id, :integer
    add_column :events, :category_id, :integer
    add_index :events, :theme_id
    add_index :events, :category_id
  end
end
