class Proverb
  def initialize(*items, qualifier: nil)
    @items = items
    @qualifier = qualifier
  end

  def to_s(output = '', index = 0)
    return output if index == @items.length
    output += (index == @items.length - 1 ? last_line(@items.first) : line(@items[index, 2]))
    to_s(output, index + 1)
  end

  private

  def line(things)
    "For want of a #{things.first} the #{things.last} was lost.\n"
  end

  def last_line(item)
    "And all for the want of a #{@qualifier + ' ' unless @qualifier.nil?}#{item}."
  end
end
