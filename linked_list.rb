Node = Struct.new(:value, :next_node)

class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = Node.new
    @tail = @head
  end

  def append(value)
    current_head = self.head
    current_head = current_head.next_node while current_head != self.tail

    if current_head == self.head && current_head == self.tail && current_head.value.nil?
      current_head.value = value
    elsif !(current_head.value.nil?) && current_head == self.tail
      current_head.next_node = Node.new(value)
      self.tail = current_head.next_node
    end
  end

  def prepend(value)
    if self.head.value.nil? && self.head == self.tail
      self.head.value = value
    elsif !(self.head.value.nil?)
      new_head = Node.new(value, self.head)
      self.head = new_head
    end
  end

  def size
    count = 0
    current_head = self.head

    while current_head != self.tail
      current_head = current_head.next_node
      count += 1
      return count += 1 if current_head == self.tail
    end
  end

  def at(index)
    current_index, current_head = 0, self.head

    while current_index != index
      current_head = current_head.next_node
      current_index += 1
    end
    current_head
  end

  def pop
    return if self.head == self.tail && self.head.value.nil?
    return self.head.value = nil if self.head == self.tail && !(self.head.value.nil?)

    current_head = self.head
    current_head = current_head.next_node until current_head.next_node.next_node == nil
    deleted_node = current_head.next_node
    current_head.next_node = nil
    self.tail = current_head
    deleted_node
  end

  def contains(value) # true of false if value in list
    current_head = self.head

    while value != current_head.value
      return false if current_head == self.tail
      current_head = current_head.next_node
    end
    true if value == current_head.value
  end

  def find(data) # returns index of node containing data, nil if not found
    index, current_head = 0, self.head

    while data != current_head.value
      return nil if current_head == self.tail
      index += 1
      current_head = current_head.next_node
    end
    index
  end

  def to_s #represent linkedlist objects as strings, to preview them in the console. ( data ) -> ( data ) -> ( data ) -> nil
    string, current_head = "", self.head
    while current_head != self.tail
      string += "( #{current_head.value} ) -> "
      current_head = current_head.next_node
    end
    string += "( #{current_head.value} ) -> nil"
  end

  # Extra Credit
  def find_index(index)
    index = 0
    current_head = self.head
    self.size - 1
  end

  def insert_at(index, value_to_insert)
    loop_count, current_head = 0, self.head

    while current_head != self.tail
      self.head = Node.new(value_to_insert, self.head) if index.zero?
      current_head.next_node = Node.new(value_to_insert, current_head.next_node) if loop_count == index - 1
      break if index.zero? || loop_count == index - 1
      loop_count, current_head = loop_count + 1, current_head.next_node
    end

    if index == self.size
      current_head.next_node = Node.new(value_to_insert)
      self.tail = current_head.next_node
    end
  end

  def remove_at(index)
    loop_count, current_head = 0, self.head

    while current_head != self.tail
      self.head, current_head = current_head.next_node, nil if index.zero?
      if loop_count == self.size - 2 && loop_count == index - 1
        self.tail, current_head.next_node = current_head, nil
      elsif loop_count == index - 1
        new_link_after_delete = current_head.next_node.next_node
        current_head.next_node = nil
        current_head.next_node = new_link_after_delete
      end
      break if index.zero? || loop_count == self.size - 2 && loop_count == index - 1 || loop_count == index - 1
      loop_count, current_head = loop_count + 1, current_head.next_node
    end
  end
end

linked_list = LinkedList.new
p linked_list

linked_list.append(4)
p linked_list
linked_list.append(10)
p linked_list
linked_list.append(14)
p linked_list

linked_list.prepend(100)
p linked_list
linked_list.prepend(300)
p linked_list

p linked_list.size
p linked_list.at(4)

p linked_list.pop
p linked_list

p linked_list.contains(14)
p linked_list.find(10)

puts linked_list.to_s

linked_list.insert_at(2, 50)
p linked_list
puts linked_list.to_s

linked_list.remove_at(4)
p linked_list
puts linked_list.to_s