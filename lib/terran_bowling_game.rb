class TerranBowlingGame < BowlingGame
  def frames_count
    10
  end

  def max_rolls_for_frame
    2
  end

  def max_rolls_for_last_frame
    3
  end

  def pins_configuration
    frames_count.times.map { 10 }
  end
end