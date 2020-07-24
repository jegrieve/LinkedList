require_relative "Node.rb"
class LinkedList
    attr_accessor :head
    def initialize
        @head = Node.new("head")
    end

    def append(value)
        current_node = self.head
        while (current_node.next_node != nil)
            current_node = current_node.next_node
        end
        current_node.next_node = Node.new(value)
    end

    def prepend(value)
        shifted_node = self.head.next_node
        self.head.next_node = Node.new(value)
        self.head.next_node.next_node = shifted_node
    end

    def at(index)
        return self.head if index == 0
        current_index = 0
        current_node = self.head
        while (current_index != index) 
            current_node = current_node.next_node
            current_index += 1
        end
        current_node
    end

    def pop
        current_node = self.head
        while (current_node.next_node.next_node != nil)
            current_node = current_node.next_node
        end
        current_node.next_node = nil
    end

    def contains?(value)
        current_node = self.head
        while (current_node.next_node != nil)
            current_node = current_node.next_node
            return true if current_node.value == value
        end
        return false if current_node.value != value
    end

    def find(value)
        current_index = 0
        current_node = self.head
        return current_index if value == "head"
        while (current_node.next_node != nil)
            current_index += 1
            current_node = current_node.next_node
            return current_index if current_node.value == value
        end
        return nil if current_node.value == nil
    end

    def to_s
        current_node = self.head
        while (current_node.next_node != nil)
            puts "( #{current_node.value} ) => "
            current_node = current_node.next_node
        end
        puts "( #{current_node.value} ) => "
        puts " nil "
    end

    def insert_at(value, index)
        current_node = self.head
        current_index = 0
        while (current_node.next_node != nil)
            if current_index + 1 == index
                inserted_node = Node.new(value)
                current_node.next_node, inserted_node.next_node = inserted_node, current_node.next_node
            end
            current_node = current_node.next_node
            current_index += 1
        end 
    end

    def remove_at(index) 
        current_node = self.head
        current_index = 0
        while (current_node.next_node != nil)
            if current_index + 1 == index
                if current_node.next_node.next_node == nil
                    current_node.next_node = nil
                else
                current_node.next_node = current_node.next_node.next_node
                end
            end
            current_index += 1
            current_node = current_node.next_node
        end
    end
end

new_list = LinkedList.new

