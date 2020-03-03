require_relative "PolyTreeNode.rb"
require "byebug"

class KnightPathFinder
    attr_reader :considered_positions
    attr_accessor :nodes

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos) #@root_node = self.root_node
        @considered_positions = [start_pos]
        @nodes = Array.new
        build_move_tree
    end

    def build_move_tree #node.root_node = [0, 0] 
        
        queue = [@root_node] #initilize queue 
        until queue.empty?
            element = queue.shift #popped off first element from queue
            position = (new_move_positions(element.value)) 
            position.each do |pos|
                node = PolyTreeNode.new(pos)
                node.parent = element
                @nodes << node
                queue << node
            end
        end
        nil
    end


    def self.valid_moves(start_pos) # 0, 0
        #debugger
        possible_moves = [
            [2 , 1], [1 , 2],
            [2, -1], [1, -2],
            [-1, -2], [-2, -1],
            [-2, 1], [-1, 2]
        ]
        moves = Array.new
        start_x = start_pos[0] # x = 0
        start_y = start_pos[1] #y = 0
        possible_moves.each do |move| #move = [1, 2]
            x, y = move # x = 1, y = 2
            new_x = x + start_x
            new_y = y + start_y 
            if (new_x >= 0 && new_x <= 7) && (new_y >= 0 && new_y <= 7)
                moves << [new_x, new_y]
            end
        end
        moves
    end

    def new_move_positions(pos)
        # debugger
        moves = KnightPathFinder.valid_moves(pos) #moves is an array of possible moves
        new_moves = moves.select {|move| !@considered_positions.include?(move)}
        @considered_positions.concat(new_moves)
        new_moves
    end

    def find_path(end_pos)
        # debugger
        @nodes.each do |node|
            if node.value == end_pos
                return trace_path_back(node)
            end
        end
        nil
    end

    def trace_path_back(node)
        element = node
        path = Array.new
        # path << node.parent.value
        while element.parent != nil
            path << element.value
            element = element.parent
        end
        path << element.value
        return path.reverse
    end
end

test = KnightPathFinder.new([0,0])
p test.find_path([6, 2])
