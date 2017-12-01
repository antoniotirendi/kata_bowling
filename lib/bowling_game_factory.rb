class BowlingGameFactory
  def self.create_terran
    BowlingGame.new(frames_count: 10, max_rolls_for_frame: 2, max_rolls_for_last_frame: 3, pins_configuration: 10.times.map {10})
  end

  def self.create_martian
    BowlingGame.new(frames_count: 12, max_rolls_for_frame: 3, max_rolls_for_last_frame: 3, pins_configuration: 12.times.map {10})
  end

  def self.create_callisto_and_terran
    BowlingGame.new(frames_count: 10, max_rolls_for_frame: 2, max_rolls_for_last_frame: nil, pins_configuration: 10.times.map {10})
  end

  def self.create_callisto_and_martian
    BowlingGame.new(frames_count: 12, max_rolls_for_frame: 3, max_rolls_for_last_frame: nil, pins_configuration: 12.times.map {10})
  end

  def self.create_venusian_and_martian
    BowlingGame.new(frames_count: 12, max_rolls_for_frame: 3, max_rolls_for_last_frame: 3, pins_configuration: (1..12).to_a)
  end

  def self.create_venusian_and_terran
    BowlingGame.new(frames_count: 10, max_rolls_for_frame: 2, max_rolls_for_last_frame: 3, pins_configuration: (1..10).to_a)
  end

  def self.create_venusian_and_callisto_and_terran
    BowlingGame.new(frames_count: 10, max_rolls_for_frame: 2, max_rolls_for_last_frame: nil, pins_configuration: (1..10).to_a)
  end

  def self.create_venusian_and_callisto_and_martian
    BowlingGame.new(frames_count: 12, max_rolls_for_frame: 3, max_rolls_for_last_frame: nil, pins_configuration: (1..12).to_a)
  end
end