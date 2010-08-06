ActionController::Routing::Routes.draw do |map|
  map.resources :tour_types

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :tour_types, :collection => {:update_positions => :post}
  end
end
