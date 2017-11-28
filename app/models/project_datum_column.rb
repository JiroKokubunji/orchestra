class ProjectDatumColumn
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :type, type: String
  field :missing, type: Integer, default: 0
  field :count, type: Integer, default: 0
  field :mean, type: Float, default: 0
  field :std, type: Float, default: 0
  field :min, type: Float, default: 0
  field :quarter, type: Float, default: 0
  field :half, type: Float, default: 0
  field :three_quarters, type: Float, default: 0
  field :max, type: Float, default: 0
  field :target, type: Boolean, default: false
  field :active, type: Boolean, default: true

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
