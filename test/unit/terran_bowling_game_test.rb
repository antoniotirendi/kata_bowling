require_relative '../test_case'

class TerranBowlingGameTest < Test::Unit::TestCase
  setup do
    @game = TerranBowlingGame.new
  end

  def test_gutter_game
    10.times { 2.times { @game.roll(0) } }

    assert_equal 0, @game.score
  end

  def test_all_ones
    10.times { 2.times { @game.roll(1) } }

    assert_equal 20, @game.score
  end

  def test_a_spare
    @game.roll(3)
    @game.roll(7)

    @game.roll(4)
    @game.roll(0)

    8.times { 2.times { @game.roll(0) } }

    assert_equal 18, @game.score
  end

  def test_final_spare
    9.times { 2.times { @game.roll(0) } }

    @game.roll(3)
    @game.roll(7)
    @game.roll(2)

    assert_equal 12, @game.score
  end

  def test_a_strike
    @game.roll(10)

    @game.roll(2)
    @game.roll(4)

    8.times { 2.times { @game.roll(0) } }

    assert_equal 22, @game.score
  end

  def test_final_strike
    9.times { 2.times { @game.roll(0) } }

    @game.roll(10)
    @game.roll(7)
    @game.roll(2)

    assert_equal 19, @game.score
  end

  def test_perfect_game
    12.times { @game.roll(10) }

    assert_equal 300, @game.score
  end
end