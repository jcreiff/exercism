Node = Struct.new(:value, :left, :right)

class Zipper
  attr_reader :tree, :focus, :parents
  alias to_tree tree

  def self.from_tree(tree)
    new(tree, tree)
  end

  def initialize(tree, focus, parents = [])
    @tree = tree
    @focus = focus
    @parents = parents
  end

  %i[left right].each do |prop|
    define_method(prop) do
      return unless focus[prop]
      self.class.new(tree, focus[prop], parents.push(focus))
    end
  end

  def value
    focus.value
  end

  %i[left right value].each do |prop|
    define_method("set_#{prop}") do |i|
      focus[prop] = i
      self
    end
  end

  def up
    return if parents.empty?
    self.class.new(tree, parents[-1], parents[0...-1])
  end

  def ==(other)
    to_tree == other.to_tree
  end
end
