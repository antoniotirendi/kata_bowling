require_relative '../test_case'

class CallistoWithMartianBowlingGameTest < Test::Unit::TestCase
  # CALLISTO RULES     when last roll is 10 you may keep rolling
  setup do
    @game = CallistoWithMartianBowlingGame.new
  end

  def test_martian_and_callisto
    11.times { 3.times { @game.roll(0) } }

    7.times {@game.roll(10)}

    assert_equal 70, @game.score
  end
end