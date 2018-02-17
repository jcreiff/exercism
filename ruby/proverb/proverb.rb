class Proverb
  def initialize(*items, qualifier: nil)
    @items = items
    @qualifier = qualifier
  end

  def to_s
    (@items.each_cons(2).map { |set| line(set) } << last_line(@items[0])).join
  end

  private

  def line(things)
    "For want of a #{things.first} the #{things.last} was lost.\n"
  end

  def last_line(item)
    "And all for the want of a #{@qualifier + ' ' if @qualifier}#{item}."
  end
end
