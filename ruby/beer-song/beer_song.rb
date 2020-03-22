module BeerNumbers
  refine Integer do
    def to_b
      case self
      when 1
        '1 bottle of beer'
      when 0
        'no more bottles of beer'
      else
        "#{self} bottles of beer"
      end
    end
  end
end


class BeerSong
  class<<self
    def verse(n)
      [bookends(n, false), middle(n), bookends(n - 1, true)].join(', ')
    end

    def recite(first, last)
      (first - last + 1..first).map { verse(_1) }.reverse.join("\n")
    end

    private

    using BeerNumbers
    def bookends(n, final)
      lyric = "#{[*0..99][n].to_b} on the wall"
      final ? lyric << ".\n" : lyric.capitalize
    end

    def middle(n)
      "#{n.to_b}.\n" << connector(n)
    end

    def connector(n)
      n.zero? ? 'Go to the store and buy some more' : "Take #{n == 1 ? 'it' : 'one'} down and pass it around"
    end
  end
end
