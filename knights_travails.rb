class KnightPathFinder

    def initialize(position)
        @position = position
    end


    def self.valid_moves(pos)
        # x, y = pos[0], pos[1]
        
        valid_pos = []

    #     pos.each_index do |i|
    #         if i == 0 && pos[i] < 7
    #             x = pos[i] + 2
    #         elsif i == 1 && pos[i] < 8
    #             y = pos[i] + 1
    #         end
    #         valid_pos << [x,y]
    #     end
    #     valid_pos
    # end


        x, y = pos

        if x < 6 && y < 7
            x += 2
            y += 1
        end
        valid_pos << [x,y]
        return valid_pos
    end







end