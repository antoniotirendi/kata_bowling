class Frame
  def initialize
    @rolls = []
  end

  def rolls(pins)
    @rolls << pins
  end

  def score
    @rolls.inject(0, :+)
  end

  def strike?
    max_score? && @rolls.count == 1
  end

  def spare?
    max_score? && max_rolls?
  end

  def bonus_for_spare
    @rolls[0]
  end

  def bonus_for_strike
    score
  end

  def is_done?
    max_score? || max_rolls?
  end

  def max_rolls?
    @rolls.count == max_rolls_for_frame
  end

  def max_rolls_for_frame
    2
  end

  def max_score?
    score == 10
  end
end