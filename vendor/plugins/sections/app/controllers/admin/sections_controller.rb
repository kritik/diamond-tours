class Admin::SectionsController < Admin::BaseController

  crudify :section, :title_attribute => :title

end
