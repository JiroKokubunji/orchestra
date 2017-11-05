class RegressionResult
  include Mongoid::Document

  field :mae, type: String
  field :mse, type: String
  field :rmse, type: String
  field :r_square, type: String
  field :feature_importance, type: String

  belongs_to :predicition_task
end
