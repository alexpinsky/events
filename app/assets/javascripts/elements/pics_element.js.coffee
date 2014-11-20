class @PicsElement
  constructor: (options = {}) ->
    @picsObj = options.picsObj

  init: ->
    @picsObj.find('a.add-pic').click @onAddPicClick
    @picsObj.find('a.remove-pic').click @onRemovePicClick
      
  onAddPicClick: (e) =>
    e.preventDefault()
    @addHandler(picOrder: $(e.currentTarget).data('order'))

  onRemovePicClick: (e) =>
    e.preventDefault()
    order = $(e.currentTarget).data('order')
    @changePreview(order: order)
    @removeHandler(picOrder: order)

  addImage: (handler) =>
    @addHandler = handler

  removeImage: (handler) =>
    @removeHandler = handler

  changePreview: (args = {}) =>
    tile = @picsObj.find('#tile-' + args.order)
    if args.imgUrl
      tile.html("<a class='th remove-pic' href='#'' data-order='" + args.order + "'><i class='icon-remove'></i></a><img src='" + args.imgUrl + "'></img>")
      tile.find('a.remove-pic').click @onRemovePicClick
    else
      tile.html("<a class='th add-pic' href='#'' data-order='" + args.order + "'><i class='icon-plus'></i></a><img src=''></img>")
      tile.find('a.add-pic').click @onAddPicClick