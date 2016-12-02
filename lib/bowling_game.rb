class BowlingGame
  def initialize
    @table = Table.new(pins_configuration: pins_configuration,
                       max_rolls_for_frame: max_rolls_for_frame,
                       max_rolls_for_last_frame: max_rolls_for_last_frame)
  end

  def roll(pins)
    @table.rolls(pins)
  end

  def score
    @table.score
  end
end