class MartianBowlingGame < TerranBowlingGame
  def frames_count
    12
  end

  def max_rolls_for_frame
    3
  end

  def max_rolls_for_last_frame
    max_rolls_for_frame
  end
end