ActionController::Routing::Routes.draw do |map|
  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :translations
  end
end
