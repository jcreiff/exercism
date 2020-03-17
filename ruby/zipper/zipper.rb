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

  def left
    return unless focus.left
    self.class.new(tree, focus.left, parents.push(focus))
  end

  def right
    return unless focus.right
    self.class.new(tree, focus.right, parents.push(focus))
  end

  def up
    return if parents.empty?
    self.class.new(tree, parents[-1], parents[0...-1])
  end

  def value
    focus.value
  end

  def set_value(new_value)
    focus.value = new_value
    self
  end

  def set_left(node)
    focus.left = node
    self
  end

  def set_right(node)
    focus.right = node
    self
  end

  def ==(other)
    [other.value, other.left, other.right] == [value, left, right]
  end
end
