define '<%= componentNamespace() %>/module', ['courier', '<%= componentNamespace() %>/controller'], (Courier, <%= componentNameCapitalized() %>Controller) ->
  <%= componentNameCapitalized() %> = Courier.module '<%= componentNameLower() %>'

  <%= componentNameCapitalized() %>.on 'start', (@options = {}) ->
    @controller       = new <%= componentNameCapitalized() %>Controller(@options)
    @router           = new Marionette.AppRouter
                          controller: @controller
                          appRoutes:
                            '<%= componentNameLower() %>': 'start'


  <%= componentNameCapitalized() %>.on 'stop', ->
    @controller.stop()