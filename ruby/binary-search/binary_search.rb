class BinarySearch
  attr_reader :list, :middle

  def initialize(list)
    raise ArgumentError, 'Invalid list' if list.sort != list
    @list = list
    @middle = find_middle(list)
  end

  def find_middle(set)
    set.count / 2
  end

  def search_for(item, position = middle, search_index = middle, search_list = list.dup)
    return position if item == search_list[search_index]
    raise RuntimeError if search_list == []
    if item > search_list[search_index]
      search_list.slice!(0..search_index)
      search_index = find_middle(search_list)
      position += search_index + 1
    else
      search_list.slice!(search_index..-1)
      search_index = find_middle(search_list)
      search_list.count.even? ? position -= search_index : position -= search_index + 1
    end
    search_for(item, position, search_index, search_list)
  end
end
