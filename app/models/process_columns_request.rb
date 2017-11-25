class ProcessColumnsRequest
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated


  field :task, type: String
  field :target_columns, type: Array, default: []

  belongs_to :project_datum
  belongs_to :preprocess_algorithm
end
