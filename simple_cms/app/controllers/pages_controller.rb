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
  end

  def delete
  end

  def destroy
  end
end
