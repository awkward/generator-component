define '<%= componentNamespace() %>/controller', ['courier', '<%= componentNamespace() %>/assets/<%= componentNameLower() %>'], (Courier, <%= componentNameCamelCased() %>View) ->
  class <%= componentNameCamelCased() %>Controller extends Marionette.Controller
    initialize: (@options = {}) ->

    start: ->
      view = new <%= componentNameCamelCased() %>View()
      # do something with view
      
      console.log 'Route <%= componentName %> hit'

    stop: ->
      console.log 'tear down the <%= componentName %> controller'