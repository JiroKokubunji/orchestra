class MachineLearningAlgorithmsController < ApplicationController
  before_action :set_machine_learning_algorithm, only: [:show, :edit, :update, :destroy]

  # GET /machine_learning_algorithms
  # GET /machine_learning_algorithms.json
  def index
    @machine_learning_algorithms = MachineLearningAlgorithm.all
  end

  # GET /machine_learning_algorithms/1
  # GET /machine_learning_algorithms/1.json
  def show
  end

  # GET /machine_learning_algorithms/new
  def new
    @machine_learning_algorithm = MachineLearningAlgorithm.new
  end

  # GET /machine_learning_algorithms/1/edit
  def edit
  end

  # POST /machine_learning_algorithms
  # POST /machine_learning_algorithms.json
  def create
    @machine_learning_algorithm = MachineLearningAlgorithm.new(machine_learning_algorithm_params)

    respond_to do |format|
      if @machine_learning_algorithm.save
        format.html { redirect_to @machine_learning_algorithm, notice: 'Machine learning algorithm was successfully created.' }
        format.json { render :show, status: :created, location: @machine_learning_algorithm }
      else
        format.html { render :new }
        format.json { render json: @machine_learning_algorithm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machine_learning_algorithms/1
  # PATCH/PUT /machine_learning_algorithms/1.json
  def update
    respond_to do |format|
      if @machine_learning_algorithm.update(machine_learning_algorithm_params)
        format.html { redirect_to @machine_learning_algorithm, notice: 'Machine learning algorithm was successfully updated.' }
        format.json { render :show, status: :ok, location: @machine_learning_algorithm }
      else
        format.html { render :edit }
        format.json { render json: @machine_learning_algorithm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machine_learning_algorithms/1
  # DELETE /machine_learning_algorithms/1.json
  def destroy
    @machine_learning_algorithm.destroy
    respond_to do |format|
      format.html { redirect_to machine_learning_algorithms_url, notice: 'Machine learning algorithm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine_learning_algorithm
      @machine_learning_algorithm = MachineLearningAlgorithm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machine_learning_algorithm_params
      params.fetch(:machine_learning_algorithm, {})
    end
end
