class ProjectDataController < ApplicationController
  before_action :set_project_datum, only: [:show, :edit, :update, :destroy]

  # GET /project_data
  # GET /project_data.json
  def index
    @project_data = ProjectDatum.all
  end

  # GET /project_data/1
  # GET /project_data/1.json
  def show
  end

  # GET /project_data/new
  def new
    @project_datum = ProjectDatum.new
  end

  # GET /project_data/1/edit
  def edit
  end

  # POST /project_data
  # POST /project_data.json
  def create
    @project_datum = ProjectDatum.new(project_datum_params)

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
      if @project_datum.update(project_datum_params)
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
      params[:project_datum].permit(:project_data)
    end
end
