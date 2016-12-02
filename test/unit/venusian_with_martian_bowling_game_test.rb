require_relative '../test_case'

class VenusianWithMartianBowlingGameTest < Test::Unit::TestCase
  # VENUSIAN RULES        a pin for first frame, and increase of one each next frame  (other rules as martian: 12 FRAMES AND 3 ROLLS FOR FRAME)
  setup do
    @game = VenusianWithMartianBowlingGame.new
  end

  def test_sum_of_three_rolls
    9.times { gutter_frame }

    @game.roll(1)
    @game.roll(2)
    @game.roll(3)

    2.times { gutter_frame }

    assert_equal 6, @game.score
  end

  def test_spare
    8.times { gutter_frame }

    @game.roll(0)
    @game.roll(2)
    @game.roll(7)

    @game.roll(3)
    @game.roll(0)
    @game.roll(0)

    2.times { gutter_frame }

    assert_equal 15, @game.score
  end

  def test_strike
    9.times { gutter_frame }

    strike_for_frame 10

    @game.roll(2)
    @game.roll(3)
    @game.roll(2)

    gutter_frame

    assert_equal 22, @game.score
  end

  def test_perfect_game
    (1..12).each { |p| strike_for_frame p }
    2.times { @game.roll(12) }

    assert_equal 266, @game.score
  end

  private

  def gutter_frame
    3.times { @game.roll(0) }
  end

  def strike_for_frame(frame_number)
    @game.roll(frame_number)
  end
end