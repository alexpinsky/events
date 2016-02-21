class CategoriesDecorator < Draper::CollectionDecorator
  def with_themes
    all = []
    object.include_themes.each do |category|
      themes = []

      category.events.each do |e|
        next if e.disabled?
        themes << { name: e.name, thumbnail_url: e.thumbnail_url }
      end

      all << { name: category.name, themes: themes }
    end

    all
  end
end
