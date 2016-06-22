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
    @page = Page.new(page_params)

    if @page.save
      # Redirect
      flash[:notice] = "The #{@page.name} page has been added."
      redirect_to({:action => 'index'})
    else
      # Render the new page again
      render('new')
    end

  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    # Update page and save to db
    if @page.update_attributes(page_params)
      flash[:notice] = "The @{page.name} page has updated successfully."

      # Redirct to the show page......
      redirect_to(:action => 'show', :id => @page.id)
    else
      render('edit')
    end

  end

  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    @page = Page.find(params[:id]).destroy

    flash[:notice] = "Page '#{@page.name}' has been deleted."

    redirect_to(:action => 'index')
  end

  # Private Methods/Vars
  private 
  def page_params 
    params.require(:page).permit(:name, :permalink, :position, :visible)
  end
  
end
