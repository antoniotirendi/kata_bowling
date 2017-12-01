require_relative '../test_case'

class CallistoWithTerranBowlingGameTest < Test::Unit::TestCase
  # CALLISTO RULES
  # when last roll is 10 you may keep rolling
  # other rules as terran
  setup do
    @game = BowlingGameFactory.create_callisto_and_terran
  end

  def test_terran_and_callisto
    9.times { gutter_frame }

    5.times { strike_for_frame }

    assert_equal 50, @game.score
  end

  private

  def gutter_frame
    2.times { @game.roll(0) }
  end

  def strike_for_frame
    @game.roll(10)
  end
end