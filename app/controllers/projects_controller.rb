class ProjectsController < ApplicationController
  def index

  end

  def new
    @project = Project.new
  end

  def create
    params.require(:project).permit(:upload_file)
    name = 'project name'
    project = {}
    project[:name] = name
    project[:file] = BSON::Binary.new(params[:project][:upload_file].read)
    project[:file_name] = params[:project][:upload_file].original_filename
    project = Project.new(project)
    if project.save
      format.html { redirect_to @project , notice: 'Upload success' }
      format.json { render action: 'show', status: :created, location: @content }
    end
  end
end
