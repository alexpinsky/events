module Analytics
  class ViewsCounter
    attr_reader :event, :ip, :referer

    def self.new_view(args)
      counter = ViewsCounter.new args
      counter.new_view
    end

    def initialize(args)
      @event    = args[:event]
      @ip       = args[:ip]
      @referer  = args[:referer]
    end

    def new_view
      view = @event.views.new ip: ip, referer: referer
      view.save
    end
  end
end