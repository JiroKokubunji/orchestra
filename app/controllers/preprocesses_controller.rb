class PreprocessesController < ApplicationController
  before_action :set_preprocess, only: [:show, :edit, :update, :destroy]

  # GET /preprocesses
  # GET /preprocesses.json
  def index
    @preprocesses = Preprocess.all
  end

  # GET /preprocesses/1
  # GET /preprocesses/1.json
  def show
  end

  # GET /preprocesses/new
  def new
    @preprocess = Preprocess.new
  end

  # GET /preprocesses/1/edit
  def edit
  end

  # POST /preprocesses
  # POST /preprocesses.json
  def create
    @preprocess = Preprocess.new(preprocess_params)

    respond_to do |format|
      if @preprocess.save
        format.html { redirect_to @preprocess, notice: 'Preprocess was successfully created.' }
        format.json { render :show, status: :created, location: @preprocess }
      else
        format.html { render :new }
        format.json { render json: @preprocess.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preprocesses/1
  # PATCH/PUT /preprocesses/1.json
  def update
    respond_to do |format|
      if @preprocess.update(preprocess_params)
        format.html { redirect_to @preprocess, notice: 'Preprocess was successfully updated.' }
        format.json { render :show, status: :ok, location: @preprocess }
      else
        format.html { render :edit }
        format.json { render json: @preprocess.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preprocesses/1
  # DELETE /preprocesses/1.json
  def destroy
    @preprocess.destroy
    respond_to do |format|
      format.html { redirect_to preprocesses_url, notice: 'Preprocess was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preprocess
      @preprocess = Preprocess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preprocess_params
      params.fetch(:preprocess, {})
    end
end
