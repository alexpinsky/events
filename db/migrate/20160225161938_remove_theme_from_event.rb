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

    add_column :events, :template_id, :integer
    add_index :events, :template_id

    Event.all.each do |event|
      event.update_attribute :template_id, themes_to_templates_map[event.theme_id]
    end

    remove_column :events, :is_theme
    remove_column :events, :theme_id
    remove_column :events, :category_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration.new
  end
end
