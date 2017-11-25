class RegressionTrainingResult
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :mae, type: String
  field :mse, type: String
  field :rmse, type: String
  field :r_square, type: String
  field :feature_importance, type: String

  belongs_to :training_request
end
