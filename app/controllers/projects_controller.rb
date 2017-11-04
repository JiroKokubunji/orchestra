class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    preprocessed_datum_id = params[:preprocessed_datum_id] || @project.preprocessed_datum[0]._id
    @preprocessed_datum = PreprocessedDatum.find(preprocessed_datum_id)
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
    id = params[:id]
    params.require(:project).permit(:name)
    project = Project.find({:id => id})
    project[:name] = params[:project][:name]
    if project.save
      redirect_to action: "index"
    end
  end

  def create
    params.require(:project).permit(:upload_file)
    name = 'project name'
    file_name = params[:project][:upload_file].original_filename
    project = Project.new do |u|
      u.name = name
      u.file_name = file_name
    end
    ppd = project.preprocessed_datum.build({:name => name,
                                            :data => params[:project][:upload_file].read})
    if ppd.save
        redirect_to action: "index"
    end
  end
end
