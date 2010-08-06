class Admin::CurrenciesController < Admin::BaseController

  crudify :currency, :title_attribute => :currency

end
