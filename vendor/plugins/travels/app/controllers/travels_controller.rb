class TravelsController < ApplicationController

  before_filter :find_all_travels
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @travel in the line below:
    @selected = params[:_search] || {}
    @attr = params[:_attr] || Hash.new
    @search = Travel.search(:active => true, :date_gt => Time.now).search(@selected)


    @travels_s = @search.paginate(:page => params[:page])
    #@travels = Travel.all
    @directions = Country.find(:all, :order => "position ASC")
    @currencies = Currency.all
    @dates = @travels_s.map{|t| t.date}.uniq
    @sections = @travels_s.map{|t| t.section}.uniq
    @durations = @travels_s.collect{|t| ["#{t.days}/#{t.nights}", t.nights] }.uniq
    @feedings = @travels_s.map{|t| t.rtype}.uniq
    @hotels = @travels_s.map{|t| t.hotel}.uniq
    @room_types = @travels_s.map{|t| t.ftype}.uniq
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
#    @travels = Travel.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/travels")
  end

end
