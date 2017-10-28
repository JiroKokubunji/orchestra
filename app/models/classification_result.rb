class ClassificationResult
  include Mongoid::Document

  field :accuracy, type: String
  field :precision, type: String
  field :recall, type: String
  field :f_value, type: String
  field :confusion_matrix, type: String
  field :feature_importance, type: String

  belongs_to :model
end
