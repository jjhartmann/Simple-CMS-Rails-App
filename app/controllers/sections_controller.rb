class SectionsController < ApplicationController
  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => 'Default', :content_type => "Blog"})
  end

  def create
    # Instantiate the section
    @section = Section.new(section_params)

    # Check it saved
    if @section.save

      flash[:notice] = "Section '#{@section.name}' Saved."
      redirect_to(:action => 'index')

    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])

    if @section.update_attributes(section_params)

      flash[:notice] = "Update '#{@section.name}' successfully"
      redirect_to(:action => 'show', :id => @section.id)
    else
      render('edit')
    end

  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy

    @section = Section.find(params[:id]).destroy

    flash[:notice] = "The section '#{@section.name}' has been deleted."

    redirect_to(:action => 'index')
  end

  private
  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content)
  end
end
