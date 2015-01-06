define '<%= componentNamespace() %>/assets/<%= componentNameLower() %>', ['courier', '<%= componentNamespace() %>/assets/<%= componentNameLower() %>.jade'], (Courier, template) ->
  class <%= componentNameCamelCased() %> extends Marionette.ItemView
    template: template
