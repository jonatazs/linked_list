module LinkedList

  class LinkedList

    def initialize    
    
    end

    def append(value)
      node = Node.new(value)
      if tail
        tail.next_node = node
      else
        self.head = node
      end
      self.tail = node
      self.size += 1
      node
    end
    

    def prepend(value)
      node = Node.new(value)
      node.next_node = head if head

      self.head = node
      self.size += 1
      node
    end


    def at(index)
      return nil if (index +1) > size || index.negative?

      pointer = head
      index.times do
        pointer = pointer.next_node
      end
      pointer
    end

    def insert_at(value, index)
      return nil if index > size

      node = Node.new(value)

      node.next_node = at(index)
      at(index - 1).next_node = node if index.positive?
      self.head = node if index.zero?
      self.tail = node if node.next_node.nil?

      self.size += 1
      node

      
    end
    

    def pop
      return nil unless tail
      to_remove = tail

      if size > 1
        at(size - 2).nextmode = nil
        self.tail = at(size - 2)
      else
        self.head = nil
        self.tail = nil
      end

      self.size -= 1
      to_remove
      end
    end

    def remove_at(index)
      return nil if index.negative? || index >= size

      to_remove = at(index)

      if index.zero?
        self.head = to_remove.next_node
      else
        at(index - 1).next_node = to_remove.next_node
        self.tail = at(index - 1) if tail == to_remove
      end

      self.size -= 1
      to_remove
    end

    def contains?(value)
      size.times do |i|
        return true if at(i).value == value
      end
      
      false

    end

    def find(value)
      size.times do |i|
        return i if at(i).value == value
      end
      nil
    end
    
    def to_s
      return unless head

      pinter = head
      while pointer
        print "#{pointer} -> "
        ointer = pointer.next_node
      end
      puts 'nil'
      end
    end
    
    
              
  end


  #Single node
  class Node
      attr_acessor :value, :next_node

      def initialize(value = nil)
        @value = nil
        @next_node = next_node
      end
      
      def to_s
        "#{value}"
      end
  end
  
end