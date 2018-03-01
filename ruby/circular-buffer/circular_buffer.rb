class CircularBuffer < Array
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def read
    raise CircularBuffer::BufferEmptyException if count.zero?
    shift
  end

  def write(element)
    raise CircularBuffer::BufferFullException if count == size
    push(element)
  end

  def write!(element)
    read if count == size
    write(element)
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
