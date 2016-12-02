require_relative '../test_case'

class TerranBowlingGameTest < Test::Unit::TestCase
  setup do
    @game = TerranBowlingGame.new
  end

  def test_gutter_game
    10.times { gutter_frame }

    assert_equal 0, @game.score
  end

  def test_all_ones
    10.times { 2.times { @game.roll(1) } }

    assert_equal 20, @game.score
  end

  def test_a_spare
    spare_for_frame

    @game.roll(4)
    @game.roll(0)

    8.times { gutter_frame }

    assert_equal 18, @game.score
  end

  def test_final_spare
    9.times { gutter_frame }

    @game.roll(3)
    @game.roll(7)
    @game.roll(2)

    assert_equal 12, @game.score
  end

  def test_a_strike
    strike_for_frame

    @game.roll(2)
    @game.roll(4)

    8.times { gutter_frame }

    assert_equal 22, @game.score
  end

  def test_final_strike
    9.times { gutter_frame }

    @game.roll(10)
    @game.roll(7)
    @game.roll(2)

    assert_equal 19, @game.score
  end

  def test_perfect_game
    12.times { strike_for_frame }

    assert_equal 300, @game.score
  end

  private

  def gutter_frame
    2.times { @game.roll(0) }
  end

  def strike_for_frame
    @game.roll(10)
  end

  def spare_for_frame
    @game.roll(3)
    @game.roll(7)
  end
end