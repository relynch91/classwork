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
end