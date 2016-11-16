require_relative '../test_case'

class VenusianWithTerranBowlingGameTest < Test::Unit::TestCase
  # VENUSIAN RULES        a pin for first frame, and increase of one each next frame  (other rules as terran)
  setup do
    @game = VenusianWithTerranBowlingGame.new
  end

  def test_a_spare
    2.times { @game.roll(0) }

    @game.roll(1)
    @game.roll(1)

    2.times { @game.roll(1) }

    7.times { 2.times { @game.roll(0) } }

    assert_equal 5, @game.score
  end

  def test_final_spare
    9.times { 2.times { @game.roll(0) } }

    @game.roll(3)
    @game.roll(7)
    @game.roll(2)

    assert_equal 12, @game.score
  end

  def test_a_strike
    2.times { @game.roll(0) }

    @game.roll(2)

    2.times { @game.roll(1) }

    7.times { 2.times { @game.roll(0) } }

    assert_equal 6, @game.score
  end

  def test_final_strike
    9.times { 2.times { @game.roll(0) } }

    @game.roll(10)
    @game.roll(7)
    @game.roll(2)

    assert_equal 19, @game.score
  end

  def test_perfect_game
    (1..10).each { |p| @game.roll(p) }
    2.times { @game.roll(10) }

    assert_equal 191, @game.score
  end

  #
  #VENUSIAN RULES in combination with any other variant
  #
  # def test_application_display_table
  #   # 1 4 4 5 6 4 5 5 10 0 1 7 3 6 4 10 2 8 6
  #
  #   |1 4|4 5|6 /|5 /|  X|0 1|7 /|6 /|  X| 2/6|
  #   |  5| 14| 29| 49| 60| 61| 77| 97|117| 133|
end