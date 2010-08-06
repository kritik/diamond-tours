Refinery::Plugin.register do |plugin|
  plugin.name = "currencies"
  plugin.activity = {
    :class => Currency,
    :title => 'currency'
  }

  plugin.directory = directory # tell refinery where this plugin is located
end
