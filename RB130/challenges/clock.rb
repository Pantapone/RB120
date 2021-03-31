class Clock
  attr_accessor :hour, :minute

  def initialize(hour, minute=0)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def +(minutes_added)
    hours_added = 0
    added = minutes_added + self.minute
    while added >= 60
      hours_added += 1
      added -= 60
    end
    self.hour += hours_added
    self.minute = added
    while self.hour > 23
      self.hour -= 24
    end
    self
  end

  def -(minutes_substracted)
    self.minute -= minutes_substracted
    while self.minute < 0
      self.hour -= 1
      self.minute += 60
    end
    while self.hour < 0
      self.hour += 24
    end
    self
  end

  def to_s
    "#{format("%.2d", "#{self.hour}")}:#{format("%.2d", "#{self.minute}")}"
  end

  def ==(other_one)
    self.hour == other_one.hour && self.minute == other_one.minute
  end
end

