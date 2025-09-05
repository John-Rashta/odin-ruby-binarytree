# Iteration methods for the binary tree
module IteratorsHelpers
  private

  def preorder_iterator(node, arr, &this_block)
    return if node.nil?

    block_given? ? this_block.call(node) : arr.push(node.data)
    preorder_iterator(node.left_node, arr, &this_block)
    preorder_iterator(node.right_node, arr, &this_block)

    arr
  end

  def inorder_iterator(node, arr, &this_block)
    return if node.nil?

    inorder_iterator(node.left_node, arr, &this_block)
    block_given? ? this_block.call(node) : arr.push(node.data)
    inorder_iterator(node.right_node, arr, &this_block)

    arr
  end

  def postorder_iterator(node, arr, &this_block)
    return if node.nil?

    postorder_iterator(node.left_node, arr, &this_block)
    postorder_iterator(node.right_node, arr, &this_block)
    block_given? ? this_block.call(node) : arr.push(node.data)

    arr
  end

  def insert_iterator(parent, current, temp_node)
    parent_node = parent
    current_node = current
    until current_node.nil?
      parent_node = current_node
      if current_node > temp_node
        current_node = current_node.left_node
      elsif current_node < temp_node
        current_node = current_node.right_node
      else
        return nil
      end
    end
    parent_node
  end

  def find_node_parent(previous_node, current_node, value)
    curr = current_node
    prev = previous_node
    while !curr.nil? && curr.data != value
      prev = curr
      curr = if value < curr.data
               curr.left_node
             else
               curr.right_node
             end
    end
    [prev, curr]
  end
end
