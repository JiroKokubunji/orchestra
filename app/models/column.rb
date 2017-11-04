class Column
  include Mongoid::Document
  field :name, type: String
  field :type, type: String
  field :active , type: Boolean
  field :target , type: Boolean

  belongs_to :preprocessed_datum
end
