class TwelveDays
  def self.song
    (1..12).to_a.map { |num| verse(num) + "\n" }.join("\n")
  end

  def self.verse(num)
    line = "On the #{VERSES[num][0]} day of Christmas my true love gave to me, "
    num.downto(1).map do |n|
      line += VERSES[n][1]
      line += 'and ' if n == 2
    end
    line
  end

  VERSES = { 1 => ['first', 'a Partridge in a Pear Tree.'],
             2 => ['second', 'two Turtle Doves, '],
             3 => ['third', 'three French Hens, '],
             4 => ['fourth', 'four Calling Birds, '],
             5 => ['fifth', 'five Gold Rings, '],
             6 => ['sixth', 'six Geese-a-Laying, '],
             7 => ['seventh', 'seven Swans-a-Swimming, '],
             8 => ['eighth', 'eight Maids-a-Milking, '],
             9 => ['ninth', 'nine Ladies Dancing, '],
             10 => ['tenth', 'ten Lords-a-Leaping, '],
             11 => ['eleventh', 'eleven Pipers Piping, '],
             12 => ['twelfth', 'twelve Drummers Drumming, '] }.freeze
end

module BookKeeping
  VERSION = 2
end
