class ProjectDatumColumnsController < ApplicationController
  before_action :set_project_datum_column, only: [:show, :edit, :update, :destroy]

  # GET /project_datum_columns
  # GET /project_datum_columns.json
  def index
    @project_datum_columns = ProjectDatumColumn.all
  end

  # GET /project_datum_columns/1
  # GET /project_datum_columns/1.json
  def show
  end

  # GET /project_datum_columns/new
  def new
    @project_datum_column = ProjectDatumColumn.new
  end

  # GET /project_datum_columns/1/edit
  def edit
  end

  # POST /project_datum_columns
  # POST /project_datum_columns.json
  def create
    @project_datum_column = ProjectDatumColumn.new(project_datum_column_params)

    respond_to do |format|
      if @project_datum_column.save
        format.html { redirect_to @project_datum_column, notice: 'Project datum column was successfully created.' }
        format.json { render :show, status: :created, location: @project_datum_column }
      else
        format.html { render :new }
        format.json { render json: @project_datum_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_datum_columns/1
  # PATCH/PUT /project_datum_columns/1.json
  def update
    respond_to do |format|
      if @project_datum_column.update(project_datum_column_params)
        format.html { redirect_to @project_datum_column, notice: 'Project datum column was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_datum_column }
      else
        format.html { render :edit }
        format.json { render json: @project_datum_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_datum_columns/1
  # DELETE /project_datum_columns/1.json
  def destroy
    @project_datum_column.destroy
    respond_to do |format|
      format.html { redirect_to project_datum_columns_url, notice: 'Project datum column was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_active
    params.fetch(:project_datum_columns).permit(:id)
    @project_datum_column = ProjectDatumColumn.find(params[:project_datum_columns][:id])
    @project_datum_column.active = !@project_datum_column.active
    @project_datum_column.save

    redirect_to controller: 'project_data', action: 'show', id: @project_datum_column.project_datum.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_datum_column
      @project_datum_column = ProjectDatumColumn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_datum_column_params
      params.fetch(:project_datum_column).permit(:id)
    end
end
