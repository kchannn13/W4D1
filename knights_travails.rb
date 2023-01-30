class KnightPathFinder

    def initialize(position)
        @position = position
    end


    def self.valid_moves(pos)     
        valid_pos = []

        x, y = pos

        if x < 6 && y < 7
            x += 2
            y += 1
        end
        valid_pos << [x,y]
        return valid_pos
    end







end