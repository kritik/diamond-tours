Refinery::Plugin.register do |plugin|
  plugin.name = "countries"
  plugin.activity = {
    :class => Country}

  plugin.directory = directory # tell refinery where this plugin is located
end
