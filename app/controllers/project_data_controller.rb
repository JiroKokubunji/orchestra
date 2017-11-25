class ProjectDataController < ApplicationController
  before_action :set_project_datum, only: [:show, :edit, :update, :destroy]

  # GET /project_data
  # GET /project_data.json
  def index
    @project_data = ProjectDatum.where(project_id: params[:project_id])
  end

  # GET /project_data/1
  # GET /project_data/1.json
  def show
  end

  # GET /project_data/new
  def new
    @project = Project.find(params[:project_id])
    @project_datum = @project.project_data.build
  end

  # GET /project_data/1/edit
  def edit
  end

  def process_columns
    params.require(:project_datum).permit(:id)
    params.require(:project_datum_columns).permit(:id)
    params.require(:process_columns_request).permit(:task)
    req = ProcessColumnsRequest.new
    req.project_datum_id = params[:project_datum][:id]
    req.task = params[:process_columns_request][:task]
    params[:project_datum_columns][:id].each do |id|
      c = req.process_columns_request_target_columns.build
      c.project_datum_column_id = id
      c.save
    end
    req.save
    MongodbMsgq.requestSync(req)
    @project_datum = ProjectDatum.find(params[:project_datum][:id])
    redirect_to @project_datum, notice: 'data columns were successfully updated.'
  end

  # POST /project_data
  # POST /project_data.json
  def create
    params.require(:project_datum)
          .permit(:id, :project_id, :upload_file, :name, :description)
    @project_datum = ProjectDatum.new
    @project_datum.project_id = params[:project_id]
    @project_datum.name = params[:project_datum][:name]
    @project_datum.description = params[:project_datum][:description]
    @project_datum.data = params[:project_datum][:upload_file].read
    @project_datum.create_datum_columns

    respond_to do |format|
      if @project_datum.save
        format.html { redirect_to @project_datum, notice: 'Project datum was successfully created.' }
        format.json { render :show, status: :created, location: @project_datum }
      else
        format.html { render :new }
        format.json { render json: @project_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_data/1
  # PATCH/PUT /project_data/1.json
  def update
    respond_to do |format|
      if @project_datum.update({:name => params[:project_datum][:name]})
        format.html { redirect_to @project_datum, notice: 'Project datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_datum }
      else
        format.html { render :edit }
        format.json { render json: @project_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_data/1
  # DELETE /project_data/1.json
  def destroy
    @project_datum.destroy
    respond_to do |format|
      format.html { redirect_to project_data_url, notice: 'Project datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_datum
      @project_datum = ProjectDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_datum_params
      params.require(:project_datum).permit(:id, :project_id, :upload_file, :name)
      params.require(:process_datum_columns).permit(:id)
      params.require(:process_columns_request).permit(:task)
    end
end
