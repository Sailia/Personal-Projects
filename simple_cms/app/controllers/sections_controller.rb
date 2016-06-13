class SectionsController < ApplicationController
  def index
    @sections = Sestion.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(subject_params)
    if @section.save
      flash[:notice] = "Section created successfully"
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
      flash[:notice] = "Section updated successfully"
      redirect_to(:action => 'show', :id => @section.id)
    else
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

  def subject_params
    params.require(:section).permit(:name, :position, :visible)
  end
end