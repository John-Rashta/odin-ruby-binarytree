# Methods to help with deleting and adjusting the tree
module DeleteHelpers
  private

  def remove_one_child(current_node, previous_node)
    new_node = if current_node.left_node.nil?
                 current_node.right_node
               else
                 current_node.left_node
               end
    return new_node if previous_node.nil?

    if !previous_node.left_node.nil? && current_node == previous_node.left_node
      previous_node.left_node = new_node
    else
      previous_node.right_node = new_node
    end
    nil
  end

  def remove_two_child(current_node)
    prev = nil
    temp = current_node.right_node
    until temp.left_node.nil?
      prev = temp
      temp = prev.left_node
    end

    if prev.nil?
      current_node.right_node = temp.right_node
    else
      prev.left_node = temp.right_node
    end
    current_node.data = temp.data
  end
end
