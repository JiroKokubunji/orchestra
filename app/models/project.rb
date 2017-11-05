class Project
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :file_name, type: String
  field :data, type: String

  has_many :project_datum
  # belongs_to :user
end
