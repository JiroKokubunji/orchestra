class TrainingRequestQueue
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :status, type: String, default: "pendding"

  belongs_to :training_request
end
