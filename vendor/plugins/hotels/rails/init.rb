Refinery::Plugin.register do |plugin|
  plugin.name = "hotels"
  plugin.activity = {
    :class => Hotel}

  plugin.directory = directory # tell refinery where this plugin is located
end
