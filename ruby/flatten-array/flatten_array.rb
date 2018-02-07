class FlattenArray
  def self.flatten(array)
    array.reject(&:nil?).each_with_object([]) do |item, output|
      item.class == Array ? output.concat(flatten(item)) : output << item
    end
  end
end

module BookKeeping
  VERSION = 1
end
