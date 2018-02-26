class Cipher
  attr_reader :key

  ALPHA = ('a'..'z').to_a
  RANDOM_KEY = Enumerator.new { |yielder| loop { yielder.yield ALPHA.sample } }

  def initialize(key = RANDOM_KEY.take(100).join)
    raise ArgumentError, 'Invalid Key' unless key =~ /\A[a-z]+\z/
    @key = key
  end

  Hash[:encode, :+, :decode, :-].each do |name, operation|
    define_method(name) { |phrase| manipulate_text(phrase, operation) }
  end

  private

  def manipulate_text(phrase, operation)
    indexes(phrase).zip(indexes(@key)).reduce('') do |memo, (a, b)|
      memo + ALPHA[a.send(operation, b) % 26]
    end
  end

  def indexes(phrase)
    phrase.chars.map(&ALPHA.method(:index))
  end
end
