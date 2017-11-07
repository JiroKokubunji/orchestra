class ProjectDatum
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :data, type: String

  belongs_to :project
  has_many :project_datum_columns, autosave: true
  has_many :machine_learning_algorithm
  has_many :preprocess_algorithms
end
