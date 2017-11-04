class ColumnsController < ApplicationController

  def update_target
    id = params[:id]
    @column = Column.find({:id => id})
    @column[:target] = true
    if @column.save
      redirect_to controller: :projects, action: :show, preprocessed_datum_id: @column[:preprocessed_datum_id], id: @column.preprocessed_datum[:project_id]
    end
  end

end
