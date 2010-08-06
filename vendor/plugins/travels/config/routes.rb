ActionController::Routing::Routes.draw do |map|
  map.resources :travels

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :travels, :collection => {:update_positions => :post}
  end
end
