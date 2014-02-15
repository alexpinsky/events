class Events
  constructor: (options={})->
    @container = options.container

  init: ->
    @initPlayer()

  initPlayer: ->
    jPlayer_object = @container.find("#jquery_jplayer_1")
    song_url = jPlayer_object.data("song")
    jPlayer_object.jPlayer
      ready: ->
        click = undefined
        kickoff = undefined
        $(this).jPlayer("setMedia",
          mp3: song_url
        ).jPlayer "play"
        click = ((if document.ontouchstart is `undefined` then "click" else "touchstart"))
        kickoff = ->
          jPlayer_object.jPlayer "play"
          document.documentElement.removeEventListener click, kickoff, true
        document.documentElement.addEventListener click, kickoff, true
      loop: true
      swfPath: "/js"

$(window).load ->
  events = new Events({container: $(".event-wrapper")})
  events.init()