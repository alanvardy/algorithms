class BinaryTree
  def initialize
    @head = nil
  end

  def add_node(value, node = @head)
    return @head = Node.new(value) if @head == nil
    if value < node.value && node.left_child == nil
      node.left_child = Node.new(value)
    elsif value >= node.value && node.right_child == nil
      node.right_child = Node.new(value)
    elsif value < node.value
      add_node(value, node.left_child)
    elsif value >= node.value
      add_node(value, node.right_child)
    else
      puts "ERROR"
    end
  end

  def build_tree(arr)
    arr.each {|node| add_node(node)}
  end
end

class Node
  attr_accessor :value, :left_child, :right_child
  def initialize(value)
    @value = value
    @left_child = nil
    @right_child = nil
  end
end


binarytree = BinaryTree.new
binarytree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])