class LastFrame < Frame
  def initialize(max_rolls_for_frame, max_rolls_for_frames, pins)
    super(max_rolls_for_frame, pins)
    @max_rolls_for_frames = max_rolls_for_frames
  end

  def is_done?
    if @max_rolls_for_frame
      (@rolls.count >= @max_rolls_for_frames && score < @pins) || max_rolls?
    else
      @rolls.count >= @max_rolls_for_frames && @rolls.last != @pins
    end
  end
end