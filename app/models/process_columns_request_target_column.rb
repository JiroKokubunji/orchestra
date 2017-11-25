class ProcessColumnsRequestTargetColumn
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  belongs_to :process_columns_request
  belongs_to :project_datum_column
end
