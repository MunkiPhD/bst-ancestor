require_relative 'common_ancestor'

describe Finder do
	context "of small tree" do
		before :each do
			# going to create a tree
			#                 10 
			#                /   \
			#               /     \
			#              6       14
			#             /  \    /  \
			#            4    8  12  16
			@tree = BSTNode.new(10)
			@tree.left_child = BSTNode.new(6)
			@tree.left_child.left_child = BSTNode.new(4)
			@tree.left_child.right_child = BSTNode.new(8)
			@tree.right_child = BSTNode.new(14)
			@tree.right_child.left_child = BSTNode.new(12)
			@tree.right_child.right_child = BSTNode.new(16)
		end

		it "finds the correct ancestor node for leaf nodes" do
			ancestor = Finder.bst_find_common_ancestor(@tree, 4, 8)
			expect(ancestor).to eq 6
		end

		it "finds ancestor for nodes on opposite sides of root" do
			ancestor = Finder.bst_find_common_ancestor(@tree, 4, 16)
			expect(ancestor).to eq 10
		end

		it "raises an exception if the root node is nil" do
			lambda { Finder.bst_find_common_ancestor(nil, 4, 16)}.should raise_error 
		end

		it "raises an exception if the desired values are equal" do
			lambda { Finder.bst_find_common_ancestor(nil, 4, 4) }.should raise_error
		end

		it "child node is null" do
			@tree.left_child.right_child = nil
			ancestor = Finder.bst_find_common_ancestor(@tree, 4, 8)
			expect(ancestor).to eq 6
		end

		it "looks for nodes that are not in the tree and belong in a subtree" do
			lambda { Finder.bst_find_common_ancestor(@tree, 1,2) }.should raise_error
		end
	end
end
