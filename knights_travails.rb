class KnightPathFinder
attr_reader :position, :considered_positions
    def initialize(position)
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

   def bfs(start_pos)
    
    positions = [start_pos]

    until positions.empty?
        pos = positions.shift
        positions.concat(new_move_positions(pos))
    end
    return true
   end
   
end