class ClassificationTrainingResultsController < ApplicationController
  before_action :set_classification_training_result, only: [:show, :edit, :update, :destroy]

  # GET /classification_training_results
  # GET /classification_training_results.json
  def index
    @classification_training_results = ClassificationTrainingResult.all
  end

  # GET /classification_training_results/1
  # GET /classification_training_results/1.json
  def show
  end

  def results
    @project_datum = ProjectDatum.find(params[:project_datum_id])
    @training_requests = TrainingRequest.where(project_datum_id: params[:project_datum_id]).all
    @classification_training_results = []
    @training_requests.each do |r|
      r.classification_training_results.each do |c|
        @classification_training_results.append(c)
      end
    end
  end


  # GET /classification_training_results/new
  def new
    @classification_training_result = ClassificationTrainingResult.new
  end

  # GET /classification_training_results/1/edit
  def edit
  end

  # POST /classification_training_results
  # POST /classification_training_results.json
  def create
    @classification_training_result = ClassificationTrainingResult.new(classification_training_result_params)

    respond_to do |format|
      if @classification_training_result.save
        format.html { redirect_to @classification_training_result, notice: 'Classification training result was successfully created.' }
        format.json { render :show, status: :created, location: @classification_training_result }
      else
        format.html { render :new }
        format.json { render json: @classification_training_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classification_training_results/1
  # PATCH/PUT /classification_training_results/1.json
  def update
    respond_to do |format|
      if @classification_training_result.update(classification_training_result_params)
        format.html { redirect_to @classification_training_result, notice: 'Classification training result was successfully updated.' }
        format.json { render :show, status: :ok, location: @classification_training_result }
      else
        format.html { render :edit }
        format.json { render json: @classification_training_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classification_training_results/1
  # DELETE /classification_training_results/1.json
  def destroy
    @classification_training_result.destroy
    respond_to do |format|
      format.html { redirect_to classification_training_results_url, notice: 'Classification training result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classification_training_result
      @classification_training_result = ClassificationTrainingResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classification_training_result_params
      params.fetch(:classification_training_result, {})
    end
end
