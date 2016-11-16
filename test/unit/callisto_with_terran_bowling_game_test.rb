require_relative '../test_case'

class CallistoWithTerranBowlingGameTest < Test::Unit::TestCase
  # CALLISTO RULES     when last roll is 10 you may keep rolling
  setup do
    @game = CallistoWithTerranBowlingGame.new
  end

  def test_terran_and_callisto
    9.times { 2.times { @game.roll(0) } }

    5.times {@game.roll(10)}

    assert_equal 50, @game.score
  end
end