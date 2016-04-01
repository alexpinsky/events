class EventPresenter

  def initialize(event)
    @event = event
  end

  def as_json(args)
    {
      id: event.id,
      name: event.name,
      url: event.url,
      state: event.state,
      template: TemplatePresenter.new(event.template).as_json(args),
      texts: event.texts,
      pictures: event.pictures,
      appearance: event.appearance,
      information: even.information
    }
  end

  private

  attr_reader :event
end