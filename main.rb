require_relative "lib/tree"

binary_tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

binary_tree.pretty_print

binary_tree.insert(6)
binary_tree.insert(5)
binary_tree.insert(9)
binary_tree.pretty_print
