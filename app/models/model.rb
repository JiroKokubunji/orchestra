class Model
  include Mongoid::Document

  field :initialize_parameter, type: String
  field :grid_search_parameter, type: String
  
  belongs_to :projects
end
