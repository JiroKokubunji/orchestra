class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    # params.require(:project).permit(:id)
    id = params[:id]
    @project = Project.find(id)
  end

  def edit
    # params.require(:project).permit(:id)
    id = params[:id]
    @project = Project.find(id)
  end


  def new
    @project = Project.new
  end

  def update
    params.require(:project).permit(:id, :name)
    project = Project.find({:id => params[:project][:id]})
    if project.save
      redirect_to action: index
    end
  end

  def create
    params.require(:project).permit(:upload_file)
    name = 'project name'
    project = {}
    project[:name] = name
    project[:file_name] = params[:project][:upload_file].original_filename
    if project.save
      redirect_to action: index
    end
  end
end
