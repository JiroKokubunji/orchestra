class DataCleaningAlgorithmsController < ApplicationController
  before_action :set_data_cleaning_algorithm, only: [:show, :edit, :update, :destroy]

  # GET /data_cleaning_algorithms
  # GET /data_cleaning_algorithms.json
  def index
    @data_cleaning_algorithms = DataCleaningAlgorithm.all
  end

  # GET /data_cleaning_algorithms/1
  # GET /data_cleaning_algorithms/1.json
  def show
  end

  # GET /data_cleaning_algorithms/new
  def new
    @data_cleaning_algorithm = DataCleaningAlgorithm.new
  end

  # GET /data_cleaning_algorithms/1/edit
  def edit
  end

  # POST /data_cleaning_algorithms
  # POST /data_cleaning_algorithms.json
  def create
    @data_cleaning_algorithm = DataCleaningAlgorithm.new(data_cleaning_algorithm_params)

    respond_to do |format|
      if @data_cleaning_algorithm.save
        format.html { redirect_to @data_cleaning_algorithm, notice: 'Data cleaning algorithm was successfully created.' }
        format.json { render :show, status: :created, location: @data_cleaning_algorithm }
      else
        format.html { render :new }
        format.json { render json: @data_cleaning_algorithm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_cleaning_algorithms/1
  # PATCH/PUT /data_cleaning_algorithms/1.json
  def update
    respond_to do |format|
      if @data_cleaning_algorithm.update(data_cleaning_algorithm_params)
        format.html { redirect_to @data_cleaning_algorithm, notice: 'Data cleaning algorithm was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_cleaning_algorithm }
      else
        format.html { render :edit }
        format.json { render json: @data_cleaning_algorithm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_cleaning_algorithms/1
  # DELETE /data_cleaning_algorithms/1.json
  def destroy
    @data_cleaning_algorithm.destroy
    respond_to do |format|
      format.html { redirect_to data_cleaning_algorithms_url, notice: 'Data cleaning algorithm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_cleaning_algorithm
      @data_cleaning_algorithm = DataCleaningAlgorithm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_cleaning_algorithm_params
      params.fetch(:data_cleaning_algorithm, {})
    end
end
