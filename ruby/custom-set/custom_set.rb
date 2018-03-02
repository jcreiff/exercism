class CustomSet < Array
  METHOD_NAMES = %i[subset? disjoint? intersection difference].freeze

  METHOD_NAMES.zip(%i[all? none? select reject]).each do |names|
    define_method(names[0]) { |other| send(names[1]) { |x| other.include?(x) } }
  end

  def ==(other)
    sort == other.sort
  end

  def add(element)
    push(element).sort unless include?(element)
    self
  end

  def union(other)
    push(other).flatten.uniq
  end
end

module BookKeeping
  VERSION = 1
end
