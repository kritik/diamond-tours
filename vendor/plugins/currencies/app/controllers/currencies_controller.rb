class CurrenciesController < ApplicationController

  before_filter :find_all_currencies
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @currency in the line below:
    present(@page)
  end

  def show
    @currency = Currency.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @currency in the line below:
    present(@page)
  end

protected

  def find_all_currencies
    @currencies = Currency.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/currencies")
  end

end
