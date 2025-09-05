require_relative "lib/tree"

# binary_tree = Tree.new(Array.new(15) { rand(1..100) })
# binary_tree.pretty_print
# p binary_tree.balanced?
# p binary_tree.level_order
# p binary_tree.preorder
# p binary_tree.postorder
# p binary_tree.inorder
# binary_tree.insert(105)
# binary_tree.insert(106)
# binary_tree.insert(120)
# binary_tree.insert(134)
# binary_tree.insert(155)
# p binary_tree.balanced?
# binary_tree.rebalance
# p binary_tree.balanced?
# binary_tree.pretty_print
# binary_tree.remove(105)
# binary_tree.pretty_print
# p binary_tree.level_order
# p binary_tree.preorder
# p binary_tree.postorder
# p binary_tree.inorder

binary_tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
binary_tree.pretty_print

binary_tree.insert(6)
binary_tree.insert(5)
binary_tree.insert(9)
binary_tree.pretty_print
p binary_tree.level_order
p binary_tree.preorder
p binary_tree.postorder
p binary_tree.inorder
binary_tree.remove(67)
binary_tree.pretty_print
p binary_tree.find(1)
p binary_tree.height(4)
p binary_tree.depth(4)
p binary_tree.height(412)
p binary_tree.depth(412)
