class @Gallery
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    @startSlide()
    @initNavigation()
    @initThemeListeners()

  themeClick: (handler) ->
    @handler = handler

  startSlide: ->
    @container.find('.slide').slick arrows: false
    @container.find('.slide').on('beforeChange', @onBeforeChange)

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
