Refinery::Plugin.register do |plugin|
  plugin.name = "travels"
  plugin.activity = {
    :class => Travel,
    :title => 'ftype'
  }

  plugin.directory = directory # tell refinery where this plugin is located
end
