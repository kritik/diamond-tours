class SectionsController < ApplicationController

  before_filter :find_all_sections
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @section in the line below:
    present(@page)
  end

  def show
    @section = Section.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @section in the line below:
    present(@page)
  end

protected

  def find_all_sections
    @sections = Section.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/sections")
  end

end
