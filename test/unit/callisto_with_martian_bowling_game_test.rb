require_relative '../test_case'

class CallistoWithMartianBowlingGameTest < Test::Unit::TestCase
  # CALLISTO RULES     when last roll is 10 you may keep rolling
  setup do
    @game = CallistoWithMartianBowlingGame.new
  end

  def test_martian_and_callisto
    11.times { gutter_frame }

    7.times { strike_for_frame }

    assert_equal 70, @game.score
  end

  private

  def gutter_frame
    3.times { @game.roll(0) }
  end

  def strike_for_frame
    @game.roll(10)
  end
end