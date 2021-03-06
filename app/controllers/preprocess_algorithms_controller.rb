class PreprocessAlgorithmsController < ApplicationController
  before_action :set_preprocess_algorithm, only: [:show, :edit, :update, :destroy]

  def select_preprocess_algorithms
    @columns = params[:project_datum_columns][:id]
    @preprocess_algorithms = PreprocessAlgorithm.all
  end

  def register_preprocess_algorithms
    params.fetch(:project_datum_columns).permit(:id)
    params.fetch(:preprocess_algorithm).permit(:id)
    project_datum_columns = ProjectDatumColumn.find(params[:project_datum_columns][:id][0])
    req = ProcessColumnsRequest.new
    req.project_datum_id = project_datum_columns.project_datum.id
    params[:project_datum_columns][:id].each do |id|
      c = req.process_columns_request_target_columns.build
      c.project_datum_column_id = id
      c.save
    end
    pa = PreprocessAlgorithm.find(params[:preprocess_algorithm][:id])
    req.task = pa.class_name
    req.preprocess_algorithm_id = params[:preprocess_algorithm][:id]
    req.save
    MongodbMsgq.requestSync(req)
    @project_datum = ProjectDatum.find(project_datum_columns.project_datum.id)
    redirect_to project_datum_url(@project_datum), notice: 'Preprocess task was successfully registered.'
  end


  # GET /preprocess_algorithms
  # GET /preprocess_algorithms.json
  def index
    @preprocess_algorithms = PreprocessAlgorithm.all
  end

  # GET /preprocess_algorithms/1
  # GET /preprocess_algorithms/1.json
  def show
  end

  # GET /preprocess_algorithms/new
  def new
    @preprocess_algorithm = PreprocessAlgorithm.new
  end

  # GET /preprocess_algorithms/1/edit
  def edit
  end

  # POST /preprocess_algorithms
  # POST /preprocess_algorithms.json
  def create
    @preprocess_algorithm = PreprocessAlgorithm.new(preprocess_algorithm_params)

    respond_to do |format|
      if @preprocess_algorithm.save
        format.html { redirect_to @preprocess_algorithm, notice: 'Preprocess algorithm was successfully created.' }
        format.json { render :show, status: :created, location: @preprocess_algorithm }
      else
        format.html { render :new }
        format.json { render json: @preprocess_algorithm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preprocess_algorithms/1
  # PATCH/PUT /preprocess_algorithms/1.json
  def update
    respond_to do |format|
      if @preprocess_algorithm.update(preprocess_algorithm_params)
        format.html { redirect_to preprocess_algorithms_url, notice: 'Preprocess algorithm was successfully updated.' }
        format.json { render :show, status: :ok, location: @preprocess_algorithm }
      else
        format.html { render :edit }
        format.json { render json: @preprocess_algorithm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preprocess_algorithms/1
  # DELETE /preprocess_algorithms/1.json
  def destroy
    @preprocess_algorithm.destroy
    respond_to do |format|
      format.html { redirect_to preprocess_algorithms_url, notice: 'Preprocess algorithm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preprocess_algorithm
      @preprocess_algorithm = PreprocessAlgorithm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preprocess_algorithm_params
      params.fetch(:preprocess_algorithm).permit(:id, :category, :module_name, :class_name)
    end
end
