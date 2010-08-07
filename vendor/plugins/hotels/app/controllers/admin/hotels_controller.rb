class Admin::HotelsController < Admin::BaseController

  crudify :hotel, :title_attribute => :title

end
