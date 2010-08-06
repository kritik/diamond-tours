ActionController::Routing::Routes.draw do |map|
  map.resources :countries

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :countries, :collection => {:update_positions => :post}
  end
end
