module Strain
  def method_missing(name, *args, &block)
    if name == :keep
      partition(&block)[0]
    elsif name == :discard
      partition(&block)[1]
    else
      raise NoMethodError, "Method `#{name}` doesn't exist."
    end
  end
end

class Array
  include Strain
end
