require_relative "00_tree_node.rb"
require "byebug"

class KnightPathFinder
attr_reader :position, :considered_positions, :node
    def initialize(position)
        # @node = PolyTreeNode.new(pos) 
        @position = position
        @considered_positions = [position]
    end




    def self.valid_moves(pos)     
        valid_pos = []

        x, y = pos

        x += 2
        y += 1
        valid_pos << [x,y]
        x, y = pos
        
        x -= 2
        y -= 1
        valid_pos << [x,y]
        x, y = pos

        x += 2
        y -= 1
        valid_pos << [x,y]
        x, y = pos

        x -= 2
        y += 1
        valid_pos << [x,y]
        x, y = pos

        y += 2
        x += 1
        valid_pos << [x,y]
        x, y = pos
        
        y -= 2
        x -= 1
        valid_pos << [x,y]
        x, y = pos

        y += 2
        x -= 1
        valid_pos << [x,y]
        x, y = pos

        y -= 2
        x += 1
        valid_pos << [x,y]
        x, y = pos

        valid_pos.select do |pos|
            (pos[0] >= 0 && pos[0] <= 7) && (pos[1] >= 0 && pos[1] <= 7)
        end
    end

   def new_move_positions(pos)
    possible_moves = KnightPathFinder.valid_moves(pos)
    moves = []

    possible_moves.each do |move|
        if !@considered_positions.include?(move)
            @considered_positions << move
            moves << move
        end
    end
    moves
   end

   def build_move_tree
    
    queue = [PolyTreeNode.new(self.position)]
     
    # count = 0
    until queue.empty?
        root_node = queue.shift
        # if queue.shift != []
        #     count += 1
        # end
        # poly = PolyTreeNode.new(pos)
        # root_node.children = new_move_positions(pos)
        new_move_positions(root_node.value).each do |pos|
            node = PolyTreeNode.new(pos)
            root_node.children << node
            node.parent = root_node
            queue << node
        end
    end
    # return count
   end



   def find_path(end_pos)
    # nodes = [self]
    nodes = [PolyTreeNode.new(self.position)]
debugger
    until nodes.empty?
        node = nodes.shift
        return node if node.value == end_pos
        
        nodes.concat(node.children)
    end
    
   end 
   
end

k = KnightPathFinder.new([0,0])
k.build_move_tree
k.find_path([6,3])