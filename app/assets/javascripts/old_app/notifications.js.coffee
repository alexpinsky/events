class @Notification
  @display: (text, type) ->
    notification = new Notification container: $('.notifications')
    notification.display text, type

  constructor: (options = {}) ->
    @container = options.container
    @id = Math.floor((1 + Math.random()) * 0x10000).toString(16)


  display: (text, type) ->
    @container.append @render(text, type)

    @notification = @container.find("##{@id}")
    @notification.find('a.close').click @onClose
    @setTimer()

  render: (text, type) ->
    "<div id='#{@id}' class='notification #{type}'>
      <div class='icon'></div>
      <div class='content'>
        <a href='#' class='close'>&times;</a>
        #{text}
      </div>
    </div>"

  onClose: (e) =>
    @remove()

  setTimer: ->
    setTimeout @remove, 5000

  remove: =>
    @notification.hide 'slow', (=> @notification.remove())
