Refinery::Plugin.register do |plugin|
  plugin.name = "tour_types"
  plugin.activity = {
    :class => TourType,
    :title => 'name'
  }

  plugin.directory = directory # tell refinery where this plugin is located
end
