ActionController::Routing::Routes.draw do |map|
  map.resources :sections

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :sections, :collection => {:update_positions => :post}
  end
end
