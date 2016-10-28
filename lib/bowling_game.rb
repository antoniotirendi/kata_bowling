class BowlingGame
  def initialize
    @table = Table.new
  end

  def roll(pins)
    @table.rolls(pins)
  end

  def score
    @table.score
  end
end