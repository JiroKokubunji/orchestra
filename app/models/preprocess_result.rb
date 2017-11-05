class PreprocessResult
  include Mongoid::Document

  field :result, type: String

  belongs_to :preprocess_task
end
