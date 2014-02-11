define '<%= componentNamespace() %>/assets/<%= componentName %>', ['courier', '<%= componentNamespace() %>/assets/<%= componentName %>.jade'], (Courier, template) ->
  class <%= componentName %> extends Marionette.Layout
    template: template

    events:
      'click p': 'doDomething'

    doSomething: (e) ->
      e.preventDefault()