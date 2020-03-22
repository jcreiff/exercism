module Strain
  def method_missing(name, *args, &block)
    if name == :keep
      partition(&block)[0]
    elsif name == :discard
      partition(&block)[1]
    else
      super
    end
  end

  def respond_to_missing?(method, *args, &block)
    %i[keep discard].include?(method) ? true : super
  end
end

Array.include(Strain)
