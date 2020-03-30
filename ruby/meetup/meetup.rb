require 'date'

class Meetup
  RANGES = { teenth: (13..19), first: (1..7), second: (8..14),
             third: (15..21), fourth: (22..28), last: (-7..-1) }.freeze

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, range)
    RANGES[range].map { Date.new(@year, @month, _1) }
                 .find { _1.send("#{weekday}?") }
  end
end
