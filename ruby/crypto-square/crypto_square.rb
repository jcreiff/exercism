class Crypto
  def initialize(text)
    @normalized_text = text.downcase.gsub(/\W/, '')
  end

  def ciphertext
    @normalized_text.empty? ? '' : rows.transpose.map(&:join).join(' ')
  end

  private

  def rows
    (@normalized_text + padding).chars.each_slice(width).to_a
  end

  def width
    Math.sqrt(@normalized_text.length).ceil
  end

  def padding
    ' ' * (width - @normalized_text.length / width)
  end
end
