class Admin::TravelsController < Admin::BaseController

  crudify :travel, :title_attribute => :hotel_id

end
