require_relative '../test_case'

class VenusianWithTerranBowlingGameTest < Test::Unit::TestCase
  # VENUSIAN RULES
  # a pin for first frame, and increase of one each next frame
  # other rules as terran
  setup do
    @game = BowlingGameFactory.create_venusian_and_terran
  end

  def test_a_spare
    gutter_frame

    @game.roll(1)
    @game.roll(1)

    2.times { @game.roll(1) }

    7.times { gutter_frame }

    assert_equal 5, @game.score
  end

  def test_final_spare
    9.times { gutter_frame }

    @game.roll(3)
    @game.roll(7)
    @game.roll(2)

    assert_equal 12, @game.score
  end

  def test_a_strike
    gutter_frame

    strike_for_frame 2

    2.times { @game.roll(1) }

    7.times { gutter_frame }

    assert_equal 6, @game.score
  end

  def test_final_strike
    9.times { gutter_frame }

    @game.roll(10)
    @game.roll(7)
    @game.roll(2)

    assert_equal 19, @game.score
  end

  def test_perfect_game
    (1..10).each { |p| strike_for_frame p }
    2.times { @game.roll(10) }

    assert_equal 191, @game.score
  end

  private

  def gutter_frame
    2.times { @game.roll(0) }
  end

  def strike_for_frame(frame_number)
    @game.roll(frame_number)
  end
end