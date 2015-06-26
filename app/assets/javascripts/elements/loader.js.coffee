class @Loader
  @on: ->
    $('body').append @render()

  @off: ->
    $('body').find('#system-loader').remove()

  @render: ->
    "<div id='system-loader'>
      <div class='spinner vertical-align'></div>
    </div>"
