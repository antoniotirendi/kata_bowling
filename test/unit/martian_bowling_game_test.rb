require_relative '../test_case'

class MartianBowlingGameTest < Test::Unit::TestCase
  # MARTIAN RULES         12 FRAMES AND 3 ROLLS FOR FRAME
  setup do
    @game = MartianBowlingGame.new
  end

  def test_sum_of_three_rolls
    @game.roll(1)
    @game.roll(2)
    @game.roll(3)

    11.times { 3.times { @game.roll(0) } }

    assert_equal 6, @game.score
  end

  def test_martian_spare
    @game.roll(1)
    @game.roll(2)
    @game.roll(7)

    @game.roll(3)
    @game.roll(0)
    @game.roll(0)

    10.times { 3.times { @game.roll(0) } }

    assert_equal 16, @game.score
  end

  def test_martian_strike
    @game.roll(10)

    @game.roll(2)
    @game.roll(3)
    @game.roll(0)

    10.times { 3.times { @game.roll(0) } }

    assert_equal 20, @game.score
  end
end