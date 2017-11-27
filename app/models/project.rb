class Project
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  validates :name, presence: true

  field :name, type: String
  field :purpose, type: String

  has_many :project_data
  # belongs_to :user
end
