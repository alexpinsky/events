class Slideshow
  constructor: (options = {}) ->
    @images = options.images

  init: ->
    @urls = []
    @urls.push $(image).attr('src') for image in @images.find('img')

  run: ->
    if @urls.length > 1
      @runSlideshow()
    else
      @setBackground(@urls[0])

  runSlideshow: ->
    i = 0
    @setBackground(@urls[i])
    setInterval (=>
      i++
      i = 0 if i == @urls.length
      @setBackground(@urls[i], slide: true)
    ), 5000

  setBackground: (url, options = {}) ->
    @images.css
      'background': "url(#{url})"
      'background-size': 'contain'
      'background-repeat': 'no-repeat'
      'background-position-x': 'center'
      'height': '100%'
    # @images.animate(
    #   opacity: 0,
    #   'slow', 
    #   (=>
    #     @images.css
    #       'background': "url(#{url})"
    #       'background-size': 'contain'
    #       'background-repeat': 'no-repeat'
    #       'background-position-x': 'center'
    #       'height': '100%'
    #     .animate(opacity: 1))
    #   )

$ ->
  slideshow = new Slideshow
    images: $(".event-wrapper").find('.images')
  slideshow.init()
  slideshow.run()