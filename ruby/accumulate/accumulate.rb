class Array
  def accumulate
    return to_enum(:accumulate) unless block_given?
    Array.new(size) { |index| yield self[index] }
  end
end

module BookKeeping
  VERSION = 1
end
