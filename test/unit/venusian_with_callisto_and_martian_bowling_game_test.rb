require_relative '../test_case'

class VenusianWithCallistoAndMartianBowlingGameTest < Test::Unit::TestCase
  # VENUSIAN RULES
  # a pin for first frame, and increase of one each next frame
  # other rules as callisto with martian:
  # when last roll is 12 you may keep rolling
  # 12 FRAMES AND 3 ROLLS FOR FRAME
  setup do
    @game = BowlingGameFactory.create_venusian_and_callisto_and_martian
  end

  def test_callisto_final_strikes
    11.times { gutter_frame }

    7.times { strike_for_frame 12 }

    assert_equal 84, @game.score
  end

  def test_a_venusian_spare
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

  private

  def gutter_frame
    3.times { @game.roll(0) }
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