class Admin::CountriesController < Admin::BaseController

  crudify :country, :title_attribute => :title

end
