require_relative "node"
require_relative "iterators_helpers"
require_relative "recursive_helpers"
require_relative "delete_helpers"
# Class tree for binary search tree
class Tree
  include IteratorsHelpers
  include RecursiveHelpers
  include DeleteHelpers

  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)
    sorted_arr = arr.uniq.sort
    make_tree(sorted_arr, 0, sorted_arr.size - 1)
  end

  def insert(value)
    temp_node = Node.new(value)
    return @root = temp_node if @root.nil?

    parent = insert_iterator(nil, @root, temp_node)
    return nil if parent.nil?

    if parent > temp_node
      parent.left_node = temp_node
    else
      parent.right_node = temp_node
    end
    @root
  end

  def remove(value)
    previous_node, current_node = find_node_parent(nil, @root, value)

    return @root if current_node.nil?

    if current_node.left_node.nil? || current_node.right_node.nil?
      temp_node = remove_one_child(current_node, previous_node)
      @root = temp_node unless temp_node.nil?
    else
      remove_two_child(current_node)
    end
    nil
  end

  def find(value)
    current_node = @root
    until current_node.nil?
      if current_node.data > value
        current_node = current_node.left_node
      elsif current_node.data < value
        current_node = current_node.right_node
      else
        return current_node
      end
    end
    nil
  end

  def level_order
    return nil if @root.nil?

    temp_arr = []
    data_arr = []
    temp_arr.push(@root)
    until temp_arr.empty?
      current_node = temp_arr[0]
      block_given? ? yield(current_node) : data_arr.push(current_node.data)
      temp_arr.push(current_node.left_node) unless current_node.left_node.nil?
      temp_arr.push(current_node.right_node) unless current_node.right_node.nil?
      temp_arr.shift
    end

    block_given? ? nil : data_arr
  end

  def inorder(&my_block)
    possible_arr = inorder_iterator(@root, [], &my_block)
    block_given? ? nil : possible_arr
  end

  def preorder(&my_block)
    possible_arr = preorder_iterator(@root, [], &my_block)
    block_given? ? nil : possible_arr
  end

  def postorder(&my_block)
    possible_arr = postorder_iterator(@root, [], &my_block)
    block_given? ? nil : possible_arr
  end

  def height(value)
    temp_node = find(value)
    return nil if temp_node.nil?

    recursive_height(temp_node)
  end

  def depth(value)
    temp_node = find(value)
    return nil if temp_node.nil?

    recursive_depth(@root, temp_node)
  end

  def balanced?
    return true if @root.nil?

    left_height = recursive_balance(@root.left_node)
    right_height = recursive_balance(@root.right_node)
    return false if left_height == false || right_height == false

    return true if [0, 1, -1].include?(left_height - right_height)

    false
  end

  def rebalance
    @root = build_tree(level_order)
  end

  def pretty_print(node = @root, prefix = "", is_left: true)
    pretty_print(node.right_node, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right_node
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_node, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left_node
  end

  private

  def make_tree(arr, start, finish)
    return nil if start > finish

    mid = start + ((finish - start) / 2)

    this_root = Node.new(arr[mid])

    this_root.left_node = make_tree(arr, start, mid - 1)
    this_root.right_node = make_tree(arr, mid + 1, finish)
    this_root
  end
end
