class Bst
  attr_reader :data, :all_branches
  attr_accessor :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
    @all_branches = [self]
  end

  def insert(number)
    new_branch = (number.class == Bst ? number : Bst.new(number))
    all_branches << new_branch
    new_branch.data <= data ? push_left(new_branch) : push_right(new_branch)
  end

  def each(&block)
    return to_enum(:each) unless block_given?
    all_branches.sort_by(&:data).map { |bst| yield bst.data }
  end

  private

  def push_left(branch)
    left.nil? ? self.left = branch : left.insert(branch)
  end

  def push_right(branch)
    right.nil? ? self.right = branch : right.insert(branch)
  end
end

module BookKeeping
  VERSION = 1
end
