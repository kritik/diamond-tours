class ResortsController < ApplicationController

  before_filter :find_all_resorts
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @resort in the line below:
    present(@page)
  end

  def show
    @resort = Resort.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @resort in the line below:
    present(@page)
  end

protected

  def find_all_resorts
    @resorts = Resort.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/resorts")
  end

end
