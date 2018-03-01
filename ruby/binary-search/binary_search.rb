class BinarySearch
  attr_reader :list, :middle

  def initialize(list, indexes = (0...list.count).to_a)
    raise ArgumentError, 'Invalid list' if list.sort != list
    @list = list
    @middle = list.count / 2
    @indexes = indexes
  end

  def search_for(i)
    raise RuntimeError if list.empty?
    result = i <=> list[middle]
    return @indexes[middle] if result.zero?
    range = result == 1 ? [middle + 1..-1] : [0...middle]
    BinarySearch.new(*[list, @indexes].map { |set| set[*range] }).search_for(i)
  end
end
