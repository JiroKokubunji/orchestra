class ProjectDatumColumn
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :type, type: String
  field :active, type: Boolean, default: true
  field :target, type: Boolean, default: false

  belongs_to :project_datum, optional: true
end
