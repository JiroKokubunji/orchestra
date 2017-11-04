class Column
  include Mongoid::Document
  field :name, type: String
  field :type, type: String

  belongs_to :preprocessed_datum
end
