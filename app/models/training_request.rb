class TrainingRequest
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :task, type: String

  belongs_to :project_datum
  belongs_to :machine_learning_algorithm
  has_many :classification_training_results
end
