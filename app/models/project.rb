class Project
  include Mongoid::Document
  field :name, type: String
  field :file_name, type: String

  has_many :preprocessed_datum

end
