class Crypto
  def initialize(text)
    @normalized_text = text.downcase.gsub(/\W/, '')
  end

  def ciphertext
    (0...width).map { |column| rows.map { |row| row[column] }.join }.join(' ')
  end

  private

  def width
    Math.sqrt(@normalized_text.length).ceil
  end

  def rows
    (@normalized_text + ' ' * padding).chars.each_slice(width)
  end

  def padding
    width.zero? ? width : width - @normalized_text.length / width
  end
end

module BookKeeping
  VERSION = 1
end
