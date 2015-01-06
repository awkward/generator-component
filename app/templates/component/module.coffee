define '<%= componentNamespace() %>/module', ['courier', '<%= componentNamespace() %>/controller'], (Courier, <%= componentNameCamelCased() %>Controller) ->
  <%= componentNameCamelCased() %> = Courier.module '<%= componentNameLowerCamelCased() %>', (module) ->
    module.startWithParent = false
    # module.modal           = true
    # module.requires        = ['header', 'footer']

  <%= componentNameCamelCased() %>.on 'start', (@options = {}) ->
    @controller       = new <%= componentNameCamelCased() %>Controller(@options)
    @router           = new Marionette.AppRouter
                          controller: @controller
                          module: this
                          appRoutes:
                            '<%= componentNameLower() %>': 'start'


  <%= componentNameCamelCased() %>.on 'stop', ->
