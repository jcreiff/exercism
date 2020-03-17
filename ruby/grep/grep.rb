class Grep
  attr_reader :pattern, :flags, :files

  def self.grep(text, flags, files)
    Grep.new(text, flags, files).grep
  end

  def initialize(pattern, flags, files)
    @pattern = pattern
    @flags = flags
    @files = {}
    files.each { |file| @files[file] = File.read(file).split("\n") }
    @matches = []
  end

  def grep
    files.each { |file, text| flags.include?("-v") ? filter_matches(file, text) : find_matches(file, text)}
    construct_output
  end

  def find_matches(file, text)
    text.each_with_index do |line, index|
      if flags.include?("-x")
        @matches.push([file, index+1, line]) if line.casecmp?(pattern)
      else
        @matches.push([file, index+1, line]) if line =~ Regexp.new(pattern, flags.include?("-i"))
      end
    end
  end

  def filter_matches(file, text)
    text.each_with_index do |line, index|
      if flags.include?("-x")
        @matches.push([file, index+1, line]) unless line.casecmp?(pattern)
      else
        @matches.push([file, index+1, line]) unless line =~ Regexp.new(pattern, flags.include?("-i"))
      end
    end
  end

  def construct_output
    return @matches.map { |match| files.count == 1 ? match[2] : [match[0], match[2]].join(":") }.join("\n") unless ["-l", "-n"].any? {|flag| flags.include?(flag)}
    return @matches.map { |match| match[0] }.uniq.join("\n") if flags.include?("-l")
    return @matches.map { |match| match[(files.count == 1 ? 1 : 0)..2].join(":") }.join("\n") if flags.include?("-n")
  end

end
