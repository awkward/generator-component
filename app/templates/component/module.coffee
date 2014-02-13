define '<%= componentNamespace() %>/module', ['courier', '<%= componentNamespace() %>/controller'], (Courier, <%= componentNameCamelCased() %>Controller) ->
  <%= componentNameCamelCased() %> = Courier.module '<%= componentNameLowerCamelCased() %>', {
    startWithParent: false
  }

  <%= componentNameCamelCased() %>.on 'start', (@options = {}) ->
    @controller       = new <%= componentNameCamelCased() %>Controller(@options)
    @router           = new Marionette.AppRouter
                          controller: @controller
                          appRoutes:
                            '<%= componentNameLower() %>': 'start'


  <%= componentNameCamelCased() %>.on 'stop', ->
    @controller.stop()