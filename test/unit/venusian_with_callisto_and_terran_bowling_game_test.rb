require_relative '../test_case'

class VenusianWithCallistoAndTerranBowlingGameTest < Test::Unit::TestCase
  # VENUSIAN RULES
  # a pin for first frame, and increase of one each next frame
  # other rules as callisto with terran:
  # when last roll is 10 you may keep rolling
  setup do
    @game = VenusianWithCallistoAndTerranBowlingGame.new
  end

  def test_callisto_final_strikes
    9.times { gutter_frame }

    5.times { strike_for_frame 10 }

    assert_equal 50, @game.score
  end

  def test_a_venusian_spare
    gutter_frame

    @game.roll(1)
    @game.roll(1)

    2.times { @game.roll(1) }

    7.times { gutter_frame }

    assert_equal 5, @game.score
  end

  private

  def gutter_frame
    2.times { @game.roll(0) }
  end

  def strike_for_frame(frame_number)
    @game.roll(frame_number)
  end

  #
  #VENUSIAN RULES in combination with callisto!
  #
  # def test_application_display_table
  #   # 1 4 4 5 6 4 5 5 10 0 1 7 3 6 4 10 2 8 6
  #
  #   |1 4|4 5|6 /|5 /|  X|0 1|7 /|6 /|  X| 2/6|
  #   |  5| 14| 29| 49| 60| 61| 77| 97|117| 133|
end