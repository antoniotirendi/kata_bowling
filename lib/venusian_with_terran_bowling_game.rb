class VenusianWithTerranBowlingGame < TerranBowlingGame
  def pins_configuration
    (1..frames_count).to_a
  end
end