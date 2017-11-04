class Project
  include Mongoid::Document
  field :name, type: String
  field :file_name, type: String

  has_one :preprocessed_datum

end
