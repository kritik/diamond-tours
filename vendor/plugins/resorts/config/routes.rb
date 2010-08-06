ActionController::Routing::Routes.draw do |map|
  map.resources :resorts

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :resorts, :collection => {:update_positions => :post}
  end
end
