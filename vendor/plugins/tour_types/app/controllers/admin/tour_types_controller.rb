class Admin::TourTypesController < Admin::BaseController

  crudify :tour_type, :title_attribute => :name

end
