class ProjectDatumColumn
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :type, type: String
  field :active, type: Boolean, default: true
  field :target, type: Boolean, default: false

  belongs_to :project_datum
  
  def set_target
    # set other coluns not target
    others = ProjectDatumColumn.where(project_datum_id: self.project_datum_id).all
    others.each do |o|
      o.target = false
      o.save
    end
    self.target = true
    self.save
  end
end
