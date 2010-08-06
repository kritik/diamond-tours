class TravelsController < ApplicationController

  before_filter :find_all_travels
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @travel in the line below:
    present(@page)
  end

  def show
    @travel = Travel.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @travel in the line below:
    present(@page)
  end

protected

  def find_all_travels
    @travels = Travel.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/travels")
  end

end
