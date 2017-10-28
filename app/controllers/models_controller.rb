class ModelsController < ApplicationController
  def index
    @models = Model.all
    @algorithms = Algorithm.all
  end
end
