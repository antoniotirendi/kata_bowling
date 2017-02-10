require_relative '../test_case'

class LastFrameTest < Test::Unit::TestCase
  def test_is_not_done_when_no_rolls
    max_rolls_for_frame = 3
    max_rolls_for_frames = 2
    pins = 10
    frame=LastFrame.new(max_rolls_for_frame, max_rolls_for_frames, pins)

    assert_false frame.is_done?
  end

  def test_is_not_done_when_not_enough_rolls_with_terran
    max_rolls_for_frame = 3
    max_rolls_for_frames = 2
    pins = 10
    frame=LastFrame.new(max_rolls_for_frame, max_rolls_for_frames, pins)
    frame.rolls(0)
    assert_false frame.is_done?
  end

  def test_is_done_when_enough_rolls
    max_rolls_for_frame = 3
    max_rolls_for_frames = 2
    pins = 10
    frame=LastFrame.new(max_rolls_for_frame, max_rolls_for_frames, pins)
    frame.rolls(0)
    frame.rolls(0)
    assert_true frame.is_done?
  end

  def test_is_not_done_when_not_enough_rolls_with_martian
    max_rolls_for_frame = 3
    max_rolls_for_frames = 3
    pins = 10
    frame=LastFrame.new(max_rolls_for_frame, max_rolls_for_frames, pins)
    frame.rolls(0)
    frame.rolls(0)
    assert_false frame.is_done?
    frame.rolls(0)
    assert_true frame.is_done?
  end

  def test_is_not_done_when_enough_rolls_but_full_score
    max_rolls_for_frame = 3
    max_rolls_for_frames = 2
    pins = 10
    frame=LastFrame.new(max_rolls_for_frame, max_rolls_for_frames, pins)
    frame.rolls(pins)
    frame.rolls(pins)
    assert_false frame.is_done?
  end

  def test_is_done_when_max_rolls_and_full_score
    max_rolls_for_frame = 3
    max_rolls_for_frames = 2
    pins = 10
    frame=LastFrame.new(max_rolls_for_frame, max_rolls_for_frames, pins)
    frame.rolls(pins)
    frame.rolls(pins)
    frame.rolls(pins)
    assert_true frame.is_done?
  end

  def test_is_not_done_when_not_enough_rolls_and_unlimited_potential_rolls
    max_rolls_for_frame = nil
    max_rolls_for_frames = 2
    pins = 10
    frame=LastFrame.new(max_rolls_for_frame, max_rolls_for_frames, pins)
    frame.rolls(0)
    assert_false frame.is_done?
  end

  def test_is_done_when_enough_rolls_and_unlimited_potential_rolls
    max_rolls_for_frame = nil
    max_rolls_for_frames = 2
    pins = 10
    frame=LastFrame.new(max_rolls_for_frame, max_rolls_for_frames, pins)
    frame.rolls(0)
    frame.rolls(0)
    assert_true frame.is_done?
  end

  def test_is_not_done_when_enough_rolls_and_unlimited_potential_rolls_but_full_score
    max_rolls_for_frame = nil
    max_rolls_for_frames = 2
    pins = 10
    frame=LastFrame.new(max_rolls_for_frame, max_rolls_for_frames, pins)
    frame.rolls(pins)
    frame.rolls(pins)
    assert_false frame.is_done?
  end

  def test_is_not_done_when_max_rolls_and_unlimited_potential_rolls_and_full_score
    max_rolls_for_frame = nil
    max_rolls_for_frames = 2
    pins = 10
    frame=LastFrame.new(max_rolls_for_frame, max_rolls_for_frames, pins)
    frame.rolls(pins)
    frame.rolls(pins)
    assert_false frame.is_done?
  end

  def test_is_not_done_when_max_rolls_and_unlimited_potential_rolls_and_not_full_score
    max_rolls_for_frame = nil
    max_rolls_for_frames = 2
    pins = 10
    frame=LastFrame.new(max_rolls_for_frame, max_rolls_for_frames, pins)
    frame.rolls(pins)
    frame.rolls(pins)
    frame.rolls(pins)
    assert_false frame.is_done?
    frame.rolls(0)
    assert_true frame.is_done?
  end
end