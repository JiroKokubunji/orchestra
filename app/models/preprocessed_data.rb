class PreprocessedData
  include Mongoid::Document
  field :file, type: String

  has_many :column
end
