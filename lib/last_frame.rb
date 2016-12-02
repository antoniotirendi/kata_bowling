class LastFrame < Frame
  def is_done?
    (@rolls.count > 1 && score < @pins) || max_rolls?
  end

  def max_score?
    score == 30
  end
end