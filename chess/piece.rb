require_relative "slideable.rb"
require_relative "steppable.rb"
require "singleton"

class Piece
    attr_reader :pos, :color, :board
    attr_writer :pos
    def initialize(pos, color, board)
        @pos = pos
        @color = color
        @board = board
    end

    # def moves # add validation function
    # end

end # End Piece Class


# -----------------------

class NullPiece < Piece
    include Singleton

    def initialize
        @symbol = " "
        @color = :none
    end

    def empty?
        true
    end

    def moves
        []
    end
    
end #End NullPiece Class


#---------------------------

class Rook < Piece
    attr_reader :symbol
    include Slideable
    def initialize(pos, color, board)
        @symbol = :rook
        super 
    end

    def move_dirs
        horizontal_dirs
    end


end

class Bishop < Piece
    include Slideable

    def initialize(pos, color, board)
        @symbol = :bishop
        super
    end

    def move_dirs
        diagonal_dirs
    end
end

class Queen < Piece
    include Slideable

    def initialize(pos, color, board)
        @symbol = :queen
        super
    end

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end

end

class Knight < Piece
    include Steppable

    def move_diffs 
        [
        [2, 1],
        [-2,1],
        [2,-1],
        [-2,-1],
        [1,2],
        [-1,2],
        [1,-2],
        [-1,-2]
        ]
    end

    def initialize(pos, color, board)
        @symbol = :knight
        super
    end


end

class King < Piece
    include Steppable

    def move_diffs 
        [
        [0,1],
        [1,0],
        [0,-1],
        [-1,0],
        [1,1],
        [-1,1],
        [-1,-1],
        [1,-1]
        ]
    end

    def initialize(pos, color, board)
        @symbol = :king
        super
    end
end

class Pawn < Piece
    attr_reader :symbol

    def initialize(pos, color, board)
        @symbol = :pawn
        super
    end

    def moves
        forward_steps + side_attacks #validate
    end

    def at_start_row?
        if color == :white && pos.first == 1
            true
        elsif color == :black && pos.first == 6
            true
        else
            false
        end
    end

    private

    def forward_dir
        color == :white ? 1 : -1
    end

    def forward_steps

        x, y = pos.first, pos.last

        forw_1 = [ x + (forward_dir * 2), y ]
        forw_2 = [ x + forward_dir, y ]

        array = []

        if forw_1.first.between?(0,7)
            if at_start_row?
                if board[forw_1].class == NullPiece || board[forw_1].color != self.color
                    array << forw_1
                end
            end
        end

        if forw_2.first.between?(0,7)
            if board[forw_2].class == NullPiece || board[forw_2].color != self.color
                array << forw_2
            end
        end

        return array
    end

    def side_attacks

        x, y = pos.first, pos.last

        array = []

        diag_1 = [ x + forward_dir, y + 1 ]
        diag_2 = [ x + forward_dir, y - 1 ]

        # check diagonals: are they in-bounds?
        # then: is there a Piece there? if so, is it an Opponent?

    
        if diag_1.all? { |coord| coord.between?(0,7) }
            if board[diag_1].class != NullPiece && board[diag_1].color != self.color
                array << diag_1
            end
        end

        if diag_2.all? { |coord| coord.between?(0,7) }
            if board[diag_2].class != NullPiece && board[diag_2].color != self.color
                array << diag_2
            end
        end

        return array
    end



end

#--------------------------
