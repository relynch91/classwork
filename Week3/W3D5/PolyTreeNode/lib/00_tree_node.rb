require "byebug"

class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = Array.new
    end

    def parent=(node) #node = nil is being passed in as node
        if @parent == nil #when the self has no parent
            @parent = node #assign parent node to any new node value
            node.children << self #adds self(node) to parent child array
        elsif node == nil #node is nil
            @parent.children.delete(self) #deletes current node from old parent children array
            @parent = node #reassigns parent to node
        elsif node #when reassigning the parent.
            @parent.children.delete(self) #parent is still old parent. 
            @parent = node #reassign parent to new node
            @parent.children << self #shovel self into new parent children
        end
    end
    
    def add_child(node)
        node.parent = self
    end    
    
    def remove_child(node)
        if node.parent == self
            node.parent = nil
        else
            raise "Error, node is not a child"
        end
    end


    def dfs(value) #value == "e"
        #debugger 
        return self if self.value == value #self = current node 
        self.children.each do |child| #children = ["a", "b"] #child = "a"  #"a" is its own node 
             x = child.dfs(value) #x = child.dfs(value) => "a".dfs(value) "a" children = ["c", "d"]
            return x if x #if x is not nil, return x 
        end
        nil
    end

    def bfs(value)
        return self if self.value == value
        queue= Array.new
        queue.concat(self.children) # queue = [child_1, child_2]
        until queue.empty? #queue is not empty 
            element = queue.shift #element == node = child_1 queue = [child_2]
            return element if element.value == value
            queue.concat(element.children) #element.child = [child_3, child_4] => queue = [child_3, child_4, child_5, child_ 6]
        end
        nil 
    end
end
