class BowlingGame
  def initialize
    @table = Table.new(frames_count: frames_count, max_rolls_for_frame: max_rolls_for_frame,
                       max_rolls_for_last_frame: max_rolls_for_last_frame, pins_configuration: pins_configuration)
  end

  def roll(pins)
    @table.rolls(pins)
  end

  def score
    @table.score
  end
end