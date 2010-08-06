ActionController::Routing::Routes.draw do |map|
  map.resources :hotels

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :hotels, :collection => {:update_positions => :post}
  end
end
