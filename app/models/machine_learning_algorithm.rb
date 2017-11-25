class MachineLearningAlgorithm
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :category, type: String
  field :module_name, type: String
  field :class_name, type: String
end
