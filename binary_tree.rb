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

  def breadth_first_search(value)
    def bfs(value, node = @head)
      puts "Node: #{node.value}, left child: #{node.left_child.value unless node.left_child.nil?}, right child: #{node.right_child.value unless node.right_child.nil?}"
      if node.value == value
        @found = true
        return node
      else
        @queue.push(node.left_child) unless node.left_child.nil?
        @queue.push(node.right_child) unless node.right_child.nil?
      end
    end
    return nil if @head == nil
    @queue = [@head]
    @found = false
    while !@queue.empty? && @found == false
      answer = bfs(value, @queue.slice!(0))
    end
    return answer
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
puts binarytree.breadth_first_search(9).inspect