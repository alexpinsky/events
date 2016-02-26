class CategoryPresenter

  def initialize(category)
    @category = category
  end

  def as_json(args)
    {
      name: category.name,
      templates: category.templates.map { |template| TemplatePresenter.new(template).as_json(args) }
    }
  end

  private

  attr_reader :category
end
