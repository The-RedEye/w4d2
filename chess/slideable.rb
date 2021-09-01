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
        # debugger
        self.move_dirs.each do |direction|
            dx, dy = direction
            moves_arr += grow_unblocked_moves_in_dir(dx, dy)
            # debugger
        end

        moves_arr

    end

    private
    
    def move_dirs
        raise "Method Not Found"
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        array = []
        origin = self.pos # [3, 4]

        found = false

        until found
            x = origin.first
            y = origin.last

            new_pos = [x + dx, y + dy]

            # is position out of bounds?
            if new_pos.any? { |coord| !coord.between?(0,7) }
                found = true
            # is position a null piece?
            elsif self.board[new_pos].instance_of?(NullPiece) # ??
                array << new_pos
                origin = new_pos
            # if position is a piece, is it the same color as us?
            elsif self.board[new_pos].color == self.color
                found = true
            # if not, it is an opponsing piece
            else
                array << new_pos
                found = true
            end

        end

        return array
    end

end
