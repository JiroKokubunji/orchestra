class ProjectDatum
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :description, type: String
  field :data, type: String

  belongs_to :project
  has_many :project_datum_columns
  has_many :training_requests
  has_many :process_columns_requests

  def create_datum_columns
    lines = self.data.split("\n")
    header = lines[0].split(',')
    header.each do |h|
      pdc = self.project_datum_columns.build(name: h.strip, type: 'object')
      pdc.save
    end
  end
end
