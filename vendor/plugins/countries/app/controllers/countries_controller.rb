class CountriesController < ApplicationController

  before_filter :find_all_countries
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @country in the line below:
    present(@page)
  end

  def show
    @country = Country.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @country in the line below:
    present(@page)
  end

protected

  def find_all_countries
    @countries = Country.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/countries")
  end

end