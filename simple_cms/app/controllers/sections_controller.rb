class SectionsController < ApplicationController

  layout "admin"

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    @pages = Page.order('position ASC')
    @page_count = Page.count + 1
  end

  def create
    @section = Section.new(subject_params)
    if @section.save
      flash[:notice] = "Section created successfully"
      redirect_to(:action => 'index')
    else
      @pages = Page.order('position ASC')
      @page_count = Page.count + 1
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.order('position ASC')
    @page_count = Page.count 
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully"
      redirect_to(:action => 'show', :id => @section.id)
    else
      @pages = Page.order('position ASC')
      @page_count = Page.count 
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section #{section.name} destroyed successfully"
    redirect_to(:action => 'index')
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end
end
