class Frame
  def initialize(max_rolls, pins)
    @rolls = []
    @max_rolls = max_rolls
    @pins = pins
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
    @rolls[0..1].inject(0, :+)
  end

  def is_done?
    max_score? || max_rolls?
  end

  def max_rolls?
    max_rolls_for_frame.nil? ? false : @rolls.count == max_rolls_for_frame
  end

  def max_rolls_for_frame
    @max_rolls
  end

  def max_score?
    score == @pins
  end
end