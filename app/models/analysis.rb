class Analysis
  include Mongoid::Document
  store_in collection: 'analyses'

  field :type, type: String

  belongs_to :project
end
