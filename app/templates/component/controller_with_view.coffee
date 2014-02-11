define '<%= componentNamespace() %>/controller', ['courier', '<%= componentNamespace() %>/assets/<%= componentNameLower() %>'], (Courier, <%= componentName %>View) ->
  class <%= componentNameCapitalized() %>Controller extends Marionette.Controller
    initialize: (@options = {}) ->

   	start: ->
   		view = new <%= componentName %>View()
   		# do something with view
   		
   		console.log 'Route <%= componentName %> hit'