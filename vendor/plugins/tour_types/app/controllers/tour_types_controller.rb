class TourTypesController < ApplicationController

  before_filter :find_all_tour_types
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @tour_type in the line below:
    present(@page)
  end

  def show
    @tour_type = TourType.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @tour_type in the line below:
    present(@page)
  end

protected

  def find_all_tour_types
    @tour_types = TourType.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/tour_types")
  end

end
