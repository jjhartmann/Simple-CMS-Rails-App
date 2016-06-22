class SubjectsController < ApplicationController
  
  layout 'admin'

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def create
    # Instantate a new object using form parameters
    @subject = Subject.new(subject_params)

    #Save the object
    if @subject.save
      # if the the save succeds, redirect to the index action

      # Flash Hash: Send notice to next page
      flash[:notice] = "Subject created successfully."

      redirect_to(:action => 'index')
    else
      #if the save fails, redisplaly th.e form so the user can fix the problems
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])

  end

  def update
    # Instantate a new object using form parameters
    @subject = Subject.find(params[:id])

    # Update the object
    if @subject.update_attributes(subject_params)
      # if the the update succeeds, redirect to the index action

      # Flash Hash: Send notice to next page
      flash[:notice] = "Subject updated successfully."

      redirect_to(:action => 'show', :id => @subject.id)
    else
      #if the update fails, redisplaly the form so the user can fix the problems
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id]).destroy

    # Flash Hash: Send notice to next page
    flash[:notice] = "Subject #{@subject.name} deleted successfully."

    redirect_to({:action => 'index'})
  end

  private
    def subject_params
      # Same as using "Params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned.
      params.require(:subject).permit(:name, :position, :visible)
    end
end
