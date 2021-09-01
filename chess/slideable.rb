module Slideable
    HORIZONTAL_DIRS =[[-1,0],[1,0],[0,1],[0,-1]]
    DIAGONAL_DIRS = [[-1,-1], [-1,1], [1,-1], [1,1]]
    

    def horizontal_dirs #rook.horizontal_dirs
       HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end
    #rook:: moves_arr.concat(rook.moves)
    def moves
        moves_arr = []
        self.move_dirs.each do |direction| 
            dx, dy = direction
            moves_arr << grow_unblocked_moves_in_dir(dx, dy)
        end

        moves_arr
    end

    private
    
    def move_dirs
        raise "Method Not Found"
    end

    def grow_unblocked_moves_in_dir(dx, dy)
      orgin = self.pos
      #
    end

end
