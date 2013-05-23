# Intention: find the common ancestor in a binary tree given two nodes
#
# Since a binary tree is setup such that 
#		children to the left of a node are always less than the value of that node 
#		children to the right of the node are always greater than the value of that node
#	using this information, as we utilize pre-order traversal down the tree, when we reach a node, we compare it against the values (x and y)
#		If the current node value is less than x and y, then the ancestor is in the right subtree
#		If the current node value is greater than x and y, then the ancestor is in the left subtree
#		if the current node value is greater than one node and less than the other, then we found our common ancestor

class BSTNode
	attr_accessor :left_child, :right_child, :value

	def initialize(value)
		@value = value
	end
end


class Finder
	# tree: the binary seach tree
	# x: value one
	# y: value two
	def self.bst_find_common_ancestor(current_node, x, y)
		if current_node == nil
			raise "null root"
		end

		if x == y
			raise "nodes values desired cannot be equal"
		end

		# if the current node value is greater, go to the left subtree
		if current_node.value > x && current_node.value > y
			return bst_find_common_ancestor(current_node.left_child, x, y)
		end

		# if the current node is less, go to the right sub tree
		if current_node.value < x && current_node.value < y
			return bst_find_common_ancestor(current_node.right_child, x, y)
		end

		# if the node is nestled between x and y, return the value
		if current_node.value < x && current_node.value > y
			return current_node.value
		end

		# also have to check for the other way around, so if it's nestled between y and x, return the value
		if current_node.value > x && current_node.value < y
			return current_node.value
		end
	end
end
