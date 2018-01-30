class Array
  def accumulate(&block)
    Array.new(size) do |index|
      if block_given?
        yield self[index]
      else
        return to_enum
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
