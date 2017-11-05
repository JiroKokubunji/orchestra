class ProjectDatumColumn
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :type, type: String
  field :active , type: Boolean
  field :target , type: Boolean

  belongs_to :project_datum
end
