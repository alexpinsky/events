class @Initializers

  @init: ->
    imagesObj = $('.images')
    if imagesObj.data('slideshow')
      imagesObj.slick
        autoplay: true,
        arrows: false,
        mobileFirst: true,
        speed: 2000
