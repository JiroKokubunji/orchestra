class PreprocessAlgorithm
  include Mongoid::Document
  field :category, type: String
  field :module_name, type: String
  field :class_name, type: String

end
