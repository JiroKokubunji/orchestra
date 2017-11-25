class ProcessColumnsRequest
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :task, type: String

  belongs_to :project_datum
  belongs_to :preprocess_algorithm, optional: true
  has_many :process_columns_request_target_columns
end
