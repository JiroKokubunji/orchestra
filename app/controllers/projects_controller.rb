class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    # params.require(:project).permit(:id)
    id = params[:id]
    @project = Project.find(id)
  end

  def new
    @project = Project.new
  end

  def create
    params.require(:project).permit(:upload_file)
    file_data = params[:project][:upload_file].read
    name = 'project name'
    project = {}
    project[:name] = name
    project[:file] = BSON::Binary.new(file_data)
    project[:file_name] = params[:project][:upload_file].original_filename
    project = Project.new(project)
    if project.save
      lines = file_data.split("\r\n")
      header = lines[0].split(',')
      header.each do |h|
        c = Column.new
        c.project_id = project._id
        c.name = h
        c.save
      end
      redirect_to action: index
    end
  end
end
