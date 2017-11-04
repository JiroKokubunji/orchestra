class PreprocessedDatum
  include Mongoid::Document
  after_create :add_columns_when_create
  field :name, type: String
  field :data, type: String

  belongs_to :project
  has_many :column

  private
    def add_columns_when_create
      data = self[:data]
      lines = data.split("\r\n")
      header = lines[0].split(',')
      header.each do |h|
        c = Column.new
        c.preprocessed_datum_id = self[:_id]
        c.name = h
        c.active = true
        c.save
      end
    end
end
