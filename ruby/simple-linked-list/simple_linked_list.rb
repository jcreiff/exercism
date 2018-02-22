class SimpleLinkedList
  attr_accessor :list

  def initialize(list = [])
    @list = list.map { |num| Element.new(num) }.reverse
  end

  def push(element)
    list.unshift(element)
    self
  end

  def pop
    list.shift
  end

  def to_a
    list.map(&:datum)
  end

  def reverse!
    return self if to_a.empty?
    list.reverse!
    to_a
  end
end

class Element
  attr_reader :datum

  def initialize(num)
    @datum = num
    @next_element = nil
  end

  def next
    @next_element
  end

  def next=(other_element)
    @next_element = other_element
  end
end

module BookKeeping
  VERSION = 1
end
