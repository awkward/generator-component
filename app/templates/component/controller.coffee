define '<%= componentNamespace() %>/controller', ['courier'], (Courier) ->
  class <%= componentNameCamelCased() %>Controller extends Marionette.Controller
    initialize: (@options = {}) ->

    start: ->
      console.log 'Route <%= componentName %> hit'
