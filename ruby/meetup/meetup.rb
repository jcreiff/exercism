require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
    @ranges = { teenth: (13..19), first: (1..7), second: (8..14),
                third: (15..21), fourth: (22..28), last: last_range }
  end

  def day(weekday, occurrence)
    @ranges[occurrence].map { |day| Date.new(@year, @month, day) }
                       .find { |date| date.send("#{weekday}?") }
  end

  private

  def last_range
    if [4, 6, 9, 11].include?(@month)
      (24..30)
    elsif @month == 2
      Date.new(@year).leap? ? (23..29) : (22..28)
    else
      (25..31)
    end
  end
end

module BookKeeping
  VERSION = 1
end
