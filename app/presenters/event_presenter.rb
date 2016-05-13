class EventPresenter

  def initialize(event, dynamic_attrs = {})
    @event = event
    @dynamic_attrs = dynamic_attrs
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
      information: event.information,
      created_at: event.created_at.to_i * 1000,
      errors: ["Template can't be blank", "Url has already been taken"]
    }
    .merge(dynamic_attrs)
  end

  private

  attr_reader :event, :dynamic_attrs
end