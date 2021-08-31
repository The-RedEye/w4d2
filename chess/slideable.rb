module Slideable
    HORIZONTAL_DIRS =[:horizontal, :vertical]
    DIAGONAL_DIRS = [:left_diag, :right_diag]
    

    def horizontal_dirs #rook.horizontal_dirs
       HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end
    
    def moves

        moves_arr = []

        origin = self.position

        if move_dirs.include?(:horizontal)
            moves_arr << grow_unblocked_moves_in_dir(0, 1)
        end



        moves_arr
    end

    private
    
    def move_dirs
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        # generate the new position using dx and dy
        # check board to see if new position is empty in the direction of dx and dy
        # if empty, add to list of possible positions
        # if not empty, don't add and stop
    end

end
