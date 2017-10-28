class AnalysesController < ApplicationController
  def columns
    project_id = params[:project_id]
    analysis = Analysis.new
    analysis[:project_id] = project_id
    if analysis.save
      redirect_to controller: :projects, action: :index
    else
      redirect_to controller: :projects, action: :new
    end
  end
end
