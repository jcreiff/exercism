class Scale
  attr_reader :root, :mode, :name

  def initialize(root, mode, steps = 'mmmmmmmmmmmm')
    @root = root.sub(/\A(\w)/) { $1.upcase }
    @mode = mode
    @name = [@root, @mode.to_s].join(' ')
    @steps = '0' + steps
  end

  def pitches
    find_notes(modulate(uses_flats? ? FLATS : SHARPS))
  end

  private

  def uses_flats?
    root =~ /b/ || root == 'F' || mode == :locrian || mode == :harmonic_minor
  end

  def modulate(notes)
    notes.rotate(notes.index(root))
  end

  def find_notes(notes)
    @steps.chars.map { |step| notes.rotate!(INTERVALS[step]).first }.uniq
  end

  FLATS = %w[C Db D Eb E F Gb G Ab A Bb B].freeze
  SHARPS = %w[C C# D D# E F F# G G# A A# B].freeze
  INTERVALS = { '0' => 0, 'm' => 1, 'M' => 2, 'A' => 3 }.freeze
end

module BookKeeping
  VERSION = 1
end
