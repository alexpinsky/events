class @PicsSelector
  constructor: (options = {}) ->
    @container = options.container

  init: (options = {}) ->

  add: (handler) ->
    @addHandler = handler

  remove: (handler) ->
    @removeHandler = handler