class BowlingGame
  def initialize
    @table = Table.new(frames_count: frames_count, max_rolls_for_frame: max_rolls_for_frame,
                       max_rolls_for_last_frame: max_rolls_for_last_frame)
  end

  def roll(pins)
    @table.rolls(pins)
  end

  def score
    @table.score
  end

  def frames_count
    10
  end

  def max_rolls_for_frame
    2
  end

  def max_rolls_for_last_frame
    3
  end
end