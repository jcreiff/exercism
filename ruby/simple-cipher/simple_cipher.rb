class Cipher
  attr_reader :key

  ALPHA = ('a'..'z').to_a

  def initialize(input = nil)
    @key = generate_key(input)
    @key_codes = generate_codes(@key)
  end

  [[:encode, :+], [:decode, :-]].each do |name, operation|
    define_method(name) do |phrase|
      manipulate_text(phrase, operation).join
    end
  end

  private

  def generate_key(input)
    raise ArgumentError, 'Invalid Key' if input =~ /[^a-z]/ || input == ''
    input || ALPHA.sample * 100
  end

  def generate_codes(phrase)
    phrase.chars.map { |char| ALPHA.index(char) }
  end

  def manipulate_text(phrase, operation)
    generate_codes(phrase).map.with_index do |index1, index2|
      ALPHA[index1.send(operation, @key_codes[index2]) % 26]
    end
  end
end
