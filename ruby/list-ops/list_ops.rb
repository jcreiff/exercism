class ListOps
  def self.arrays(object, size = 0)
    object.each { |_| size += 1 }
    size
  end

  def self.reverser(object, new_object: [])
    object.size.times { new_object.push(object.pop) }
    new_object
  end

  def self.concatter(*objects, new_object: [])
    objects.each { |object| new_object << object }
    new_object.flatten
  end

  def self.mapper(object, &block)
    object.each_with_index { |el, i| object[i] = yield el }
  end

  def self.filterer(object, &block)
    object.each_with_index { |el, i| object[i] = nil unless yield el }.compact
  end

  def self.sum_reducer(object, total: 0)
    object.each { |num| total += num }
    total
  end

  def self.factorial_reducer(object, total: 1)
    object.each { |num| total *= num }
    total
  end
end

module BookKeeping
  VERSION = 2
end
