class BeerSong
  def initialize
    @irregulars = { 1 => '1 bottle', 0 => 'no more bottles', -1 => '99 bottles' }
    @bottles = Hash.new { |h, k| h[k] = k.to_s + ' bottles' }.merge(@irregulars)
  end

  def verse(n)
    first(@bottles[n]) + penultimate(n) + final(@bottles[n - 1])
  end

  def verses(first, last)
    (last..first).map { |n| verse(n) }.reverse.join("\n")
  end

  private

  def first(count)
    "#{count.capitalize} of beer on the wall, #{count} of beer.\n"
  end

  def penultimate(n)
    return out_of_beer if n.zero?
    "Take #{n == 1 ? 'it' : 'one'} down and pass it around, "
  end

  def out_of_beer
    'Go to the store and buy some more, '
  end

  def final(count)
    "#{count} of beer on the wall.\n"
  end
end

module BookKeeping
  VERSION = 3
end
