class Algorithm
  include Mongoid::Document
  field :category, type: String
  field :module_name, type: String
  field :class_name, type: String
  field :initialize_parameter, type: String
  field :grid_search_parameter, type: String
end
