# recursive methods  to help binary tree
module RecursiveHelpers
  private

  def recursive_height(node)
    return -1 if node.nil?

    left_height = recursive_height(node.left_node)
    right_height = recursive_height(node.right_node)
    return left_height + 1 if left_height > right_height

    right_height + 1
  end

  def recursive_depth(curr, node)
    return 0 if curr == node

    if curr > node
      recursive_depth(curr.left_node, node)
    else
      rrecursive_depth(curr.right_node, node)
    end + 1
  end

  def recursive_balance(node)
    return -1 if node.nil?

    left_height = recursive_balance(node.left_node)
    right_height = recursive_balance(node.right_node)
    return false if left_height == false || right_height == false

    return false unless [0, 1, -1].include?(left_height - right_height)
    return left_height + 1 if left_height > right_height

    right_height + 1
  end
end
