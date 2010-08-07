Refinery::Plugin.register do |plugin|
  plugin.name = "resorts"
  plugin.activity = {
    :class => Resort}

  plugin.directory = directory # tell refinery where this plugin is located
end
