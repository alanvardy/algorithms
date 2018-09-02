class LinkedList

  def initialize
    @head = nil
  end

  def append(data = nil) #adds node to end of list
    if @head.nil?
      @head = Node.new(data)
      @head.value = data
      @head
    else
      tail.next_node = Node.new(data)
    end
  end

  def prepend(data) #adds node to start of list
    @head = Node.new(data, @head)
  end

  def size #returns integer size
    def count(node, num)
      if node.next_node.nil?
        return num
      else
        count(node.next_node, num + 1)
      end
    end
    count(@head, 1)
  end

  def head #returns first node
    return @head
  end

  def tail #returns last node
    def go_to_end(node)
      return node if node.next_node.nil?
      go_to_end(node.next_node)
    end
    go_to_end(@head)
  end

  def at(index) #returns node at index
    def traverse(node, counter)
      if counter == 0
        return node
      else
        traverse(node.next_node, counter - 1)
      end
    end
    return @head if index == 0
    traverse(@head.next_node, index - 1)
  end

  def pop #remove last element from list and return it
    last_node = tail
    at(size - 2).next_node = nil
    last_node.value
  end

  def contains?(item, node = @head) #returns true if the passed in value is in the list and otherwise returns false
    if node == nil
      return false
    elsif node.value == item
      return true
    else
      contains?(item, node.next_node)
    end
  end

  def find(data, node = @head, index = 0) #return index of data or nil if not found
    puts "Index: #{index}, value: #{node.value}"
    if node == nil
      return nil
    elsif node.value == data
      return index
    else
      find(data, node.next_node, index += 1)
    end
  end

  def to_s #convert all values to strings
    def all_node_data(node, string)
      string += "( #{node.value} ) -> "
      if node.next_node.nil?
        string += "nil"
      else
        all_node_data(node.next_node, string)
      end
    end
    string = " "
    all_node_data(@head, string) unless head.nil?
  end

  def insert_at(data, index) #inserts the node at the given index
    if index == 0
      prepend(data)
    elsif index == size
      append(data)
    else
      before = at(index - 1)
      after = at(index)
      before.next_node = Node.new(data, after)
    end
  end

  def remove_at(index) #removes the node at the given index
    if index == 0
      @head = at(1)
    elsif index == size
      pop
    else
      before = at(index - 1)
      after = at(index + 1)
      before.next_node = after
    end
  end
end

class Node
  attr_accessor :next_node, :value
  def initialize(value, next_node = nil)
    @next_node = next_node
    @value = value
  end
end

linked_list = LinkedList.new
linked_list.append(123)
linked_list.append(456)
linked_list.append(789)
linked_list.prepend(0)
linked_list.remove_at(2)
puts linked_list.to_s