Refinery::Plugin.register do |plugin|
  plugin.name = "sections"
  plugin.activity = {
    :class => Section}

  plugin.directory = directory # tell refinery where this plugin is located
end
