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

    11.times { gutter_frame }

    assert_equal 6, @game.score
  end

  def test_spare
    spare_for_frame

    @game.roll(3)
    @game.roll(0)
    @game.roll(0)

    10.times { gutter_frame }

    assert_equal 16, @game.score
  end

  def test_final_spare
    11.times { gutter_frame }

    @game.roll(3)
    @game.roll(7)
    @game.roll(2)

    assert_equal 12, @game.score
  end

  def test_strike
    strike_for_frame

    @game.roll(2)
    @game.roll(3)
    @game.roll(2)

    10.times { gutter_frame }

    assert_equal 22, @game.score
  end

  def test_final_strike
    11.times { gutter_frame }

    @game.roll(10)
    @game.roll(7)
    @game.roll(2)

    assert_equal 19, @game.score
  end

  def test_perfect_game
    14.times { strike_for_frame }

    assert_equal 360, @game.score
  end

  private

  def gutter_frame
    3.times { @game.roll(0) }
  end

  def strike_for_frame
    @game.roll(10)
  end

  def spare_for_frame
    @game.roll(1)
    @game.roll(2)
    @game.roll(7)
  end
end