class LastFrame < Frame
  def is_done?
    (@rolls.count > 1 && score < @pins) || max_rolls?
  end

  def max_score?
    score == 30
  end

  def bonus_for_strike
    @rolls[0..1].inject(0, :+)
  end
end