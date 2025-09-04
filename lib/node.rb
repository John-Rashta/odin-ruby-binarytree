# Node class for tree nodes
class Node
  attr_accessor :data, :left_node, :right_node

  include Comparable

  def initialize(value = nil)
    @data = value
    @left_node = nil
    @right_node = nil
  end

  def <=>(other)
    @data <=> other.data
  end
end
