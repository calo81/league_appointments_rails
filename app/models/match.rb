class Match
  include Mongoid::Document
  field :schedule_for, type: Date,
  field :schedule_accepted, type: Boolean,
  field :schedule_accepted_by, type: Player,
  field :played_on, type: Date,
  field :result, type: String,
  field :winner, type: Player,
  field :scheduled_by, type: Player,
  field :division, type: Division,
  field :potential_oponents, type: Array,
  field :player1, type: Player,
  field :player2, type: Player,
  field :loser, type: Player
end
