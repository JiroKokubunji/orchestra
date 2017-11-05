class PredictionTask
  include Mongoid::Document

  field :status, type: String
  field :initialize_parameter, type: String
  field :grid_search_parameter, type: String

  belongs_to :project_datum, :machine_learning_algorithm
  has_one :classfication_result, :regression_result
end