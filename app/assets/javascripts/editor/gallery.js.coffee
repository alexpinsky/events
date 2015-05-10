class @Gallery
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    @startSlide()


  onBeforeChange: (e, slick, currentIndex, nextIndex) =>
    nextCategoryName = $(slick.$slides.get(nextIndex)).data('category-name')
    @container.find('.gallery-header .category-name').text(nextCategoryName)


  startSlide: ->
    @container.find('.slide').slick()
    @container.find('.slide').on('beforeChange', @onBeforeChange)