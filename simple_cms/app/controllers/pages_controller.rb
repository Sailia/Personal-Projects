class PagesController < ApplicationController
  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    # * Save the object
    if @page.save
    # * If save succeeds, redirect to to the index action
    flash[:notice] = "Page created successfully"
    redirect_to(:action => 'index')
    # * If save fails, redisplay the form so the user can fix problems
    else 
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(subject_params)
      flash[:notice] = "Page updated successfully"
      redirect_to(:action => "Show", :id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page #{page.name} destroyed successfully"
    redirect_to(:action => 'index')
  end

  private 

  def page_params
    params.require(:page).permit(:name, :position, :visible)
  end
end
