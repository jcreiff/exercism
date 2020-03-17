class Grep
  attr_reader :pattern, :flags, :files

  def self.grep(text, flags, files)
    Grep.new(text, flags, files).grep
  end

  def initialize(pattern, flags, files)
    @flags = Hash[flags.collect { |flag| [flag, true] }]
    @files = Hash[files.collect { |file| [file, File.read(file).split("\n")] }]
    @pattern = Regexp.new(@flags['-x'] ? "^#{pattern}$" : pattern, @flags['-i'])
    @result = []
  end

  def grep
    files.each { |title, full_text| find_result(title, full_text) }
    @result.join("\n")
  end

  def find_result(title, full_text)
    full_text.each_with_index do |line, i|
      store(title, i, line) if flags['-v'] ? line !~ pattern : line =~ pattern
    end
  end

  def store(title, i, text)
    if flags['-l']
      @result.push(title).uniq!
    else
      entry = [!files.one? ? title : nil, flags['-n'] ? i + 1 : nil, text]
      @result.push(entry.compact.join(':'))
    end
  end
end
