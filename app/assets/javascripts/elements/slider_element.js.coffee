class @SliderElement
  constructor: (options = {}) ->
    @slider_obj = options.slider_obj

  init: ->
    @slider_list = @slider_obj.find('ul')
    slideCount = @slider_list.find('li').length
    @slideWidth = @slider_list.find('li').width()
    slideHeight = @slider_list.find('li').height()
    sliderUlWidth = slideCount * @slideWidth

    @slider_obj.css
      width: @slideWidth,
      height: slideHeight
    
    @slider_list.css
      width: sliderUlWidth,
      marginLeft: - @slideWidth
    
    @slider_list.find('li:last-child').prependTo('.slider-element ul');

    @slider_obj.find("a.prev").click @moveLeft
    @slider_obj.find("a.next").click @moveRight

    @slider_obj.find('.th').click @onThemeClick

  moveLeft: (e) =>
    @slider_list.animate
      left: + @slideWidth, 
      200, =>
        @slider_list.find("li:last-child").prependTo(".slider-element ul")
        @slider_list.css("left", "")

  moveRight: (e) =>
    @slider_list.animate
      left: - @slideWidth, 
      200, =>
        @slider_list.find("li:first-child").appendTo(".slider-element ul")
        @slider_list.css("left", "")

  onThemeClick: (e) =>
    e.preventDefault()
    target_obj = $(e.target)
    @handler
      theme: target_obj.data('theme'),
      category: target_obj.data('category')

  themeClick: (handler) =>
    @handler = handler
    