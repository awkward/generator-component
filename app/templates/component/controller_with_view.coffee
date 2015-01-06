define '<%= componentNamespace() %>/controller', ['courier', '<%= componentNamespace() %>/assets/<%= componentNameLower() %>'], (Courier, <%= componentNameCamelCased() %>View) ->
  class <%= componentNameCamelCased() %>Controller extends Marionette.Controller
    initialize: (@options = {}) ->

    start: ->
      # 1. get some data

      # 2. render view
      view = new <%= componentNameCamelCased() %>View()
      # region.show(view)
