class PreprocessTask
  include Mongoid::Document

  field :status, type: String
  field :initialize_parameter, type: String
  field :grid_search_parameter, type: String

  belongs_to :project_datum, :preprocess_algorithm
  has_one :preprocess_result
end
