class League
  include Mongoid::Document
  field :title, type: String
  field :start_date, type: Date
  field :end_date, type: Date
  
  has_many :divisions
end
