class Admin::ResortsController < Admin::BaseController

  crudify :resort, :title_attribute => :title

end
