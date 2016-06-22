class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({:name => "Default", :permalink => "http://..."})
  end

  def create
    # Instantiate object
    # Assign values
    # Redirect
  end

  def edit
    @page = Page.find(params[:id])
  end

  def delete
    @page = Page.find(params[:id])
  end
end
