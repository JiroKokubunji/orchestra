class ProjectDatum
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :data, type: String

  belongs_to :project
  has_many :project_datum_column, :machine_learning_algorithm, :preprocess_algorithms
end
