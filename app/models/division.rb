class Division
  include Mongoid::Document
  field :league, type: String
  field :title, type: String
  
  belongs_to :league
  has_and_belongs_to_many :players, inverse_of: :divisions
end
