class Atbash
  ALPHA = ('a'..'z').to_a.join
  def self.encode(text)
    decode(text).chars.each_slice(5).map(&:join).join(' ')
  end

  def self.decode(text)
    text.downcase.gsub(/\W/, '').tr(ALPHA, ALPHA.reverse)
  end
end
