class Project
  include Mongoid::Document
  field :name, type: String
  field :file_name, type: String

  def save
    if self.save
      prd = PreprocessedData.new
      prd[:data] = data
      prd.save
      lines = data.split("\r\n")
      header = lines[0].split(',')
      header.each do |h|
        c = Column.new
        c[:preprocessed_data_id] = prd._id
        c[:name] = h
        c.save
      end
    end
  end
end
