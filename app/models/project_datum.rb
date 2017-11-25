class ProjectDatum
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :data, type: String

  belongs_to :project
  has_many :project_datum_columns
  has_many :machine_learning_algorithms
  has_many :preprocess_algorithms
  has_many :training_requests
  has_many :process_columns_requests
end
