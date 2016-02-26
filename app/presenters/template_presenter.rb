class TemplatePresenter

  def initialize(template)
    @template = template
  end

  def as_json(args)
    {
      name: template.name,
      thumbnail_url: template.thumbnail_url
    }
  end

  private

  attr_reader :template
end
