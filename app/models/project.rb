class Project
  include Mongoid::Document
  field :name, type: String
  field :file, type: BSON::Binary
  field :file_name, type: String

  has_many :column
end
