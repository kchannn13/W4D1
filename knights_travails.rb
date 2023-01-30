require_relative "00_tree_node.rb"

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
            (pos[0] >= 0 && pos[0] <= 8) && (pos[1] >= 0 && pos[1] <= 8)
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
     
    count = 0
    until queue.empty?
        root_node = queue.shift
        # poly = PolyTreeNode.new(pos)
        # root_node.children = new_move_positions(pos)
        new_move_positions(root_node.value).each do |pos|
            node = PolyTreeNode.new(pos)
            root_node.children << node
            node.parent = root_node
            queue << node
            count += 1
        end
    end
    return count
   end
   
end