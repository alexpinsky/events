class @Preview
  constructor: (options = {}) ->
    @container = options.container

  updateText: (id, val) =>
    console.log "updateText: id: #{id}, val: #{val}"
    console.log @container.find("##{id}")
    @container.find("##{id}").text val

  updateFont: (id, val) =>
    console.log "updateFont: id: #{id}, val: #{val}"

  updateColor: (id, val) =>
    console.log "updateColor: id: #{id}, val: #{val}"

  updateSize: (id, val) =>
    console.log "updateSize: id: #{id}, val: #{val}"
