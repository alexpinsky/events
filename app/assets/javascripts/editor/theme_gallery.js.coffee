class @ThemeGallery
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    @startSlide()
    @initNavigation()
    @initThemeListeners()

  click: (handler) ->
    @handler = handler

  startSlide: ->
    slideObj = @container.find('.slide')
    slideObj.on('init', (->
      $(this).css 'visibility', 'visible'
    ))
    slideObj.slick arrows: false
    slideObj.show()

    slideObj.on('beforeChange', @onBeforeChange)

  initNavigation: ->
    @container.find('.gallery-header .prev').click @slidePrev
    @container.find('.gallery-header .next').click @slideNext

  initThemeListeners: ->
    @container.find('.gallery-theme').click @onThemeClick

  onThemeClick: (e) =>
    e.preventDefault()
    theme = $(e.currentTarget)
    @handler category: theme.data('category'), theme: theme.data('theme')

  slidePrev: =>
    @container.find('.slide').slick 'slickPrev'

  slideNext: =>
    @container.find('.slide').slick 'slickNext'

  onBeforeChange: (e, slick, currentIndex, nextIndex) =>
    nextSlide = $(slick.$slides.get(nextIndex))
    @changeCategroyName nextSlide

  changeCategroyName: (nextSlide) ->
    nextCategoryName = nextSlide.data('category-name')
    @container.find('.gallery-header .category-name').text(nextCategoryName)
