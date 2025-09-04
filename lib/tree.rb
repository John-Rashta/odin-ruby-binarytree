require_relative "node"
# Class tree for binary search tree
class Tree
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

    parent = nil
    current_node = @root
    until current_node.nil?
      parent = current_node
      if current_node > temp_node
        current_node = current_node.left_node
      elsif current_node < temp_node
        current_node = current_node.right_node
      else
        return @root
      end
    end

    if parent > temp_node
      parent.left_node = temp_node
    else
      parent.right_node = temp_node
    end
    @root
  end

  def remove(value)
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
