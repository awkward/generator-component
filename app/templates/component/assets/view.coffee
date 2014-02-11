define '<%= componentNamespace() %>/assets/<%= componentNameLower() %>', ['courier', '<%= componentNamespace() %>/assets/<%= componentNameLower() %>.jade'], (Courier, template) ->
  class <%= componentName %> extends Marionette.Layout
    template: template

    events:
      'click p': 'doDomething'

    doSomething: (e) ->
      e.preventDefault()