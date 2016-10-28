class Table
  def initialize(frames_count:, max_rolls_for_frame:, max_rolls_for_last_frame:)
    @current_frame_position = 0
    @total_score = 0
    @frames = (frames_count-1).times.map { Frame.new(max_rolls_for_frame) }
    if max_rolls_for_frame == max_rolls_for_last_frame
      @frames << Frame.new(max_rolls_for_frame)
    else
      @frames << LastFrame.new(max_rolls_for_last_frame)
    end
  end

  def rolls(pins)
    current_frame = @frames[@current_frame_position]
    current_frame.rolls(pins)
    @current_frame_position += 1 if current_frame.is_done?
  end

  def score
    @frames.each_with_index do |frame, index|
      frame_score = frame.score
      if @frames[index+1]
        frame_score += @frames[index+1].bonus_for_spare if frame.spare?
        if frame.strike?
          frame_score += @frames[index+1].bonus_for_strike
          if @frames[index+1].strike? && @frames[index+2]
            frame_score += @frames[index+2].bonus_for_spare
          end
        end
      end
      @total_score += frame_score
    end
    @total_score
  end
end