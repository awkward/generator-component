define '<%= componentNamespace() %>/controller', ['courier'], (Courier) ->
  class <%= componentNameCapitalized() %>Controller extends Marionette.Controller
    initialize: (@options = {}) ->

   	start: ->
   		console.log 'Route <%= componentName %> hit'